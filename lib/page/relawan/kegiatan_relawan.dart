import 'package:flutter/material.dart';
import 'dashboard_relawan.dart';
import 'komunitas_relawan.dart';
import 'diskusi.dart';
import 'akun_relawan.dart';
import 'tambah_kegiatan.dart';

class KegiatanScreen extends StatefulWidget {
  @override
  _KegiatanScreenState createState() => _KegiatanScreenState();
}

class _KegiatanScreenState extends State<KegiatanScreen> {
  int _currentIndex = 1; // Indeks ikon Kegiatan

  List<String> kegiatanList = ['Kegiatan 1', 'Kegiatan 2', 'Kegiatan 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan Berlangsung'),
      ),
      body: Center(
        child: _buildBody(),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onItemTapped: _onItemTapped,
      // ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 1:
        return ListView(
          children: [
            Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kegiatan Sedang Berlangsung'),
                  SizedBox(height: 10),
                  for (String kegiatan in kegiatanList)
                    ListTile(
                      title: Text(kegiatan),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TambahKegiatanScreen(),
                  ),
                );
              },
              child: Text('Tambah Kegiatan'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali ke Home'),
            ),
          ],
        );
      case 2:
        return KomunitasScreen();
      case 3:
        return DiskusiScreen();
      case 4:
        return AkunScreen();
      default:
        return HomeScreen();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
