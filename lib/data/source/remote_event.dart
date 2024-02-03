import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:relisa/data/model/event_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteEvent {
  final String baseUrl;

  RemoteEvent(this.baseUrl);

  Future<List<Event>> fetchEvents(String? token) async {
    try {
      // Lakukan permintaan ke API dan dapatkan respons
      final response = await http
          .get(Uri.parse('http://192.168.237.25:8080/api/events'), headers: {
        'Authorization': 'Bearer $token',
      });

      // Periksa status respons
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        // Pastikan bahwa data yang diterima adalah array/list
        if (data is List) {
          // Konversi setiap elemen dalam array menjadi objek Event
          List<Event> events =
              data.map((eventJson) => Event.fromJson(eventJson)).toList();
          return events;
        } else if (data is Map<String, dynamic>) {
          // Jika respons adalah objek tunggal, konversi ke dalam List<Event>
          return [Event.fromJson(data)];
        } else {
          throw Exception('Format respons tidak valid');
        }
      } else {
        throw Exception('Gagal memuat event. Status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error pada metode fetchEvents: $error');
      throw Exception('Gagal memuat event');
    }
  }
}
