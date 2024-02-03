import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;
import 'dart:convert';
import 'kegiatan_dialog.dart';

class KegiatanEvent extends StatefulWidget {
  const KegiatanEvent({Key? key}) : super(key: key);

  @override
  _KegiatanEventState createState() => _KegiatanEventState();
}

class _KegiatanEventState extends State<KegiatanEvent> {
  List<Map<String, dynamic>> events = [];
  List<Map<String, dynamic>> filteredEvents = [];

  bool isLoading = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var myresponse =
          await myhttp.get(Uri.parse("http://192.168.237.25:8080/api/events"));
      if (myresponse.statusCode == 200) {
        print("Berhasil GET DATA");
        Map<String, dynamic> responseData =
            json.decode(myresponse.body) as Map<String, dynamic>;
        List<dynamic> dataList = responseData['data'] as List<dynamic>;
        setState(() {
          events = dataList.cast<Map<String, dynamic>>();
          filteredEvents = events;
        });
      } else {
        print("ERROR ${myresponse.statusCode}");
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _filterEvents(String query) {
    setState(() {
      filteredEvents = events.where((event) {
        final eventName = event['name'].toLowerCase();
        return eventName.contains(query.toLowerCase());
      }).toList();
    });
  }

  Widget _buildSearchResults() {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.80,
          ),
          itemCount: filteredEvents.length,
          itemBuilder: (context, index) {
            var event = filteredEvents[index];
            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 0.5),
              ),
              child: InkWell(
                onTap: () {
                  _showKegiatanDialog(
                    event['id'] ?? 0,
                    event['name'] ?? '',
                    event['ketentuan'] ?? '',
                    event['poster'] ?? '',
                    event['tanggal'] ?? '',
                    event['deskripsi'] ?? 'Tidak ada deskripsi.',
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'ID: ${event['id']}',
                    //   style: TextStyle(fontSize: 18),
                    // ),
                    Text(
                      'Name: ${event['name']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    if (event['poster'] != null)
                      Image.network(
                        "http://192.168.237.25:8080/storage/${event['poster']}",
                        height: 215,
                        width: 165,
                        // width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showKegiatanDialog(int id, String name, String ketentuan,
      String posterUrl, String tanggal, String deskripsi) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KegiatanDialog(
          id: id,
          name: name,
          ketentuan: ketentuan,
          posterUrl: posterUrl,
          tanggal: tanggal,
          deskripsi: deskripsi,
        );
      },
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Daftar Kegiatan",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  value: 1,
                  color: Colors.blue,
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 16),
                    child: TextField(
                      onChanged: _filterEvents,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        labelText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _buildSearchResults(),
                  ),
                ],
              ),
      ),
    );
  }
}

class KegiatanSearchDelegate extends SearchDelegate {
  final _KegiatanEventState eventState;

  KegiatanSearchDelegate(this.eventState);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return eventState._buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return eventState._buildSearchResults();
  }
}
