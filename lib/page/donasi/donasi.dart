import 'package:flutter/material.dart';

class DonasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donasi'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Masukkan jumlah donasi'),
      ),
    );
  }
}
