import 'package:flutter/material.dart';
import 'dashboard_relawan.dart'; // Import file home.dart untuk menggunakan HomeScreen

class KomunitasScreen extends StatefulWidget {
  @override
  _KomunitasScreenState createState() => _KomunitasScreenState();
}

class _KomunitasScreenState extends State<KomunitasScreen> {
  int _currentIndex = 2; // Indeks ikon Komunitas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Komunitas'),
      ),
      body: Center(
        child: _buildBody(),
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
      color: _currentIndex == index ? Colors.blue : Colors.black,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        // Gantilah dengan konten Komunitas sesuai kebutuhan
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ini adalah halaman Komunitas'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali ke Home'),
              ),
            ],
          ),
        );
      case 2:
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ini adalah halaman Komunitas'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali ke Home'),
              ),
            ],
          ),
        );

      case 3:
        // Gantilah dengan konten Diskusi sesuai kebutuhan
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ini adalah halaman Diskusi'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali ke Home'),
              ),
            ],
          ),
        );
      case 4:
        // Gantilah dengan konten Akun sesuai kebutuhan
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ini adalah halaman Akun'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali ke Home'),
              ),
            ],
          ),
        );
      default:
        return HomeScreen();
    }
  }
}
