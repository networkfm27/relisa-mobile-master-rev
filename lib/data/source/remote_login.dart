// import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:relisa/data/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteLogin {
  Future login(email, password) async {
    Login? loginData;
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('http://192.168.237.25:8000/api/login'));
    request.body = json.encode({"email": "$email", "password": "$password"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      loginData = Login.fromRawJson(await response.stream.bytesToString());
      prefs.setString('token', loginData.token!);
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
