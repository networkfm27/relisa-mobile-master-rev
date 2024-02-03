import 'package:flutter/material.dart';
import 'login.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/relisa.png',
                  height: 100,
                ),
                const SizedBox(height: 15),
                Text(
                  'RELAWAN \n LINGKUNGAN SOSIAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Ulurkan tanganmu & Buat Perubahan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            )),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue, // Warna latar belakang biru
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Align(
                alignment: Alignment(0, -0.5), // Posisikan relawan lebih tinggi
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat datang di',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      'RELISA',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Gunakan email untuk masuk ke aplikasi',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    FloatingActionButton(
                      onPressed: () {
                        // Navigasi ke halaman login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Icon(Icons.arrow_forward),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
