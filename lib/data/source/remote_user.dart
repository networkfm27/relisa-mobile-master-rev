import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:relisa/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteUser {
  Future<User> user(token) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request =
        http.Request('GET', Uri.parse('http://192.168.237.25:8000/api/me'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    User user = User.fromRawJson(await response.stream.bytesToString());
    print(user.name);

    if (response.statusCode == 200) {
      return user;
    } else {
      print(response.reasonPhrase);
      return user;
    }
  }
}
