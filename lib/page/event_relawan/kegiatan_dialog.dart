import 'package:flutter/material.dart';

class KegiatanDialog extends StatelessWidget {
  final int id;
  final String name;
  final String ketentuan;
  final String posterUrl;
  final String tanggal;
  final String deskripsi;

  KegiatanDialog({
    required this.id,
    required this.name,
    required this.ketentuan,
    required this.posterUrl,
    required this.tanggal,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Detail Kegiatan'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('ID: $id'),
            Text('Name: $name'),
            Text('Ketentuan: $ketentuan'),
            Text('Poster:'),
            Image.network(
              "http://192.168.237.25:8080/storage/$posterUrl",
              height: 400,
              width: 600,
              fit: BoxFit.cover,
            ),
            Text('Tanggal: $tanggal'),
            Text('Deskripsi: $deskripsi'),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
