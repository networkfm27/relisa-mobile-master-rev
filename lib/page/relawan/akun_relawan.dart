import 'package:flutter/material.dart';

class AkunScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 3,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/relisa.png',
                height: 30,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RELAWAN LINGKUNGAN SOSIAL',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Ulurkan tanganmu & buat perubahan',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini adalah halaman Akun'),
            ElevatedButton(
              onPressed: () {
                // Kembali ke halaman Home
                Navigator.pop(context);
              },
              child: Text('Kembali ke Home'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white24,
          border: Border(
            top: BorderSide(
              width: 1.5,
              color: Colors.black,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildFooterIcon(Icons.home, 0),
            buildFooterIcon(Icons.calendar_today, 1),
            buildFooterIcon(Icons.people, 2),
            buildFooterIcon(Icons.chat_bubble, 3),
            buildFooterIcon(Icons.person, 4),
          ],
        ),
      ),
    );
  }

  Widget buildFooterIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        _onItemTapped(index);
      },
      color: Colors.black,
    );
  }

  void _onItemTapped(int index) {
    // Implementasikan logika pemindahan layar sesuai kebutuhan
  }
}
