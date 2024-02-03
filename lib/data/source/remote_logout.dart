import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:relisa/data/model/user_model.dart';

class RemoteLogout {
  Future logout(token) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request =
        http.Request('GET', Uri.parse('http://192.168.237.25:8080/api/logout'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    if (response.statusCode == 200) {
      return true;
      // print(await response.stream.bytesToString());
    } else {
      return false;
      // print(response.reasonPhrase);
    }
  }
}
