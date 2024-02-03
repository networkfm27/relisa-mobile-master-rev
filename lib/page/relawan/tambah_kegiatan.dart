import 'package:flutter/material.dart';

class TambahKegiatanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kegiatan'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Form untuk menambahkan kegiatan
              TextField(
                decoration: InputDecoration(labelText: 'Nama Kegiatan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk menyimpan kegiatan
                  // Misalnya, tambahkan ke daftar kegiatan dan kembali ke halaman sebelumnya
                  Navigator.pop(context);
                },
                child: Text('Simpan Kegiatan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
