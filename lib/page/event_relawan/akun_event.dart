import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:relisa/data/model/user_model.dart';
import 'package:relisa/data/source/remote_logout.dart';
import 'package:relisa/data/source/remote_user.dart';
import 'package:relisa/page/event_relawan/event_layout.dart';
import 'package:relisa/page/event_relawan/edit_profile_event.dart';
import 'package:relisa/page/event_relawan/setting_akun_event.dart';
import 'package:relisa/page/login.dart';
import 'package:relisa/page/tentang_relisa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AkunEventRelawan extends StatefulWidget {
  const AkunEventRelawan({Key? key}) : super(key: key);

  @override
  State<AkunEventRelawan> createState() => _AkunEventRelawanState();
}

class _AkunEventRelawanState extends State<AkunEventRelawan> {
  // String userName = 'Relawan';
  User? user;
  String? token;
  bool isLoading = false;

  Future getData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token');
    });

    final response = await RemoteUser().user(token);
    setState(() {
      user = response;
      isLoading = false;
    });
  }

  Future logout() async {
    final response = await RemoteLogout().logout(token);
    if (response == true) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Thank you ^_^',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ));
      // ignore: use_build_context_synchronously
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Gagal'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
            value: 1,
          ))
        : SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .primaryColor, // Ganti dengan warna AppBar
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EventLayout(),
                              ),
                            );
                          },
                        ),
                        Text(
                          'Akun',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            width:
                                48), // Atur lebar agar sesuai dengan ikon AppBar
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/relisa.png', height: 80),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${user!.name}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    // Logika untuk pindah ke halaman Edit Profil
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProfile(),
                                      ),
                                    );
                                  },
                                  child: Text('Edit Profil'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black, // Warna garis
                          thickness: 0.2, // Ketebalan garis
                          height:
                              50, // Jarak antara garis dan elemen di atasnya
                        ),
                        GestureDetector(
                          onTap: () {
                            // Logika untuk menangani klik pada teks "Pengaturan"
                            // Misalnya, pindah ke halaman pengaturan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingPage(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.settings),
                              SizedBox(width: 10),
                              Text(
                                'Pengaturan',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black, // Warna garis
                          thickness: 0.2, // Ketebalan garis
                          height:
                              50, // Jarak antara garis dan elemen di atasnya
                        ),
                        GestureDetector(
                          onTap: () {
                            // Logika untuk menangani klik pada teks "Tentang RELISA"
                            // Misalnya, pindah ke halaman tentang RELISA
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TentangRelisa(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.info),
                              SizedBox(width: 10),
                              Text(
                                'Tentang RELISA',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black, // Warna garis
                          thickness: 0.2, // Ketebalan garis
                          height:
                              50, // Jarak antara garis dan elemen di atasnya
                        ),
                        ElevatedButton(
                            onPressed: () {
                              logout();
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 0),
                              backgroundColor: Colors.blue,
                            ),
                            child: Text(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              "Keluar",
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
