import 'package:flutter/material.dart';

class TentangRelisa extends StatelessWidget {
  const TentangRelisa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang RELISA'),
      ),
      body: Center(
        child: Text('Isi halaman tentang RELISA di sini'),
      ),
    );
  }
}
