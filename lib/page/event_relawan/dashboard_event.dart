import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:relisa/data/model/user_model.dart';
import 'package:relisa/data/source/remote_user.dart';
import 'package:relisa/page/donasi/donasi.dart';
import 'package:relisa/page/event_relawan/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardEvent extends StatefulWidget {
  const DashboardEvent({Key? key}) : super(key: key);

  @override
  State<DashboardEvent> createState() => _DashboardEventState();
}

class _DashboardEventState extends State<DashboardEvent> {
  String? token;
  User? user;

  bool isLoading = false;

  final List<String> carouselImages = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
  ];

  Future getData() async {
    setState(() {
      isLoading = !isLoading;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print(token);

    final response = await RemoteUser().user(token);
    setState(() {
      user = response;
    });
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              value: 1,
              color: Colors.blue,
            ))
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarContainer(),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white12,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hallo,',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            'Selamat Datang, ${user!.name}!👋',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Aksi yang ingin diambil ketika tombol ditekan
                                  print('Tombol $index ditekan!');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: index == 0
                                      ? Colors.red
                                      : index == 1
                                          ? Colors.green
                                          : index == 2
                                              ? Colors.blue
                                              : Colors.black,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.linked_camera,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Kategori $index',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonasiScreen()),
                        );
                      },
                      // Card dan isinya tetap berada di dalam body
                      child: Card(
                        color: Colors.blueAccent,
                        elevation: 5,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Berikan Donasi',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        color: Colors.amberAccent,
                        elevation: 5,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kegiatan',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        color: Colors.greenAccent,
                        elevation: 5,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kelola Komunitas Anda',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "COMING SOON",
                        style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigoAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 1),
                        height: 200.0,
                        viewportFraction: 0.5,
                        enlargeCenterPage: true,
                      ),
                      // items: myData,
                      items: carouselImages.map(
                        (imagePath) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // color: Colors.white,
                              color: Colors.amber
                                  .withOpacity(0.2), // Set the desired opacity
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                      0.5), // Set the shadow color and opacity
                                  spreadRadius:
                                      2, // Set the spread radius of the shadow
                                  blurRadius:
                                      5, // Set the blur radius of the shadow
                                  offset: const Offset(
                                      0, 2), // Set the offset of the shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                imagePath,
                                width: null,
                                height: 250,
                                fit: BoxFit
                                    .cover, // Adjust this based on your requirement
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(height: 20),
                    //   items: [
                    //     "Bersih Sekolah",
                    //     "Bersih Hutan ku",
                    //     "Bersih pantai",
                    //     "Bersih Kandang",
                    //     "Bersih Jos"
                    //   ].map(
                    //     (i) {
                    //       return Container(
                    //         width: MediaQuery.of(context).size.width,
                    //         margin: EdgeInsets.symmetric(horizontal: 5.0),
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(5),
                    //             color: Colors.amber),
                    //         child: Center(
                    //           child: Text(
                    //             '$i',
                    //             // 'Konten $i',
                    //             style: TextStyle(fontSize: 16.0),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ).toList(),
                