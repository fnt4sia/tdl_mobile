import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  static String username = '';
  static String password = '';
  static bool isLoggedIn = false;

  static Future<bool> tryRegister(
      String usernameTemp, String passwordTemp) async {
    final url = Uri.parse(
      'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/users/$usernameTemp.json',
    );
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': usernameTemp,
        'password': passwordTemp,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> userRegistered(String usernameTemp) async {
    final url = Uri.parse(
        'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/users/$usernameTemp.json');
    final response = await http.get(url);
    final value = jsonDecode(response.body);
    if (value != null) {
      return true;
    }
    return false;
  }

  static Future<bool> tryLogin(String usernameTemp, String passwordTemp) async {
    final url = Uri.parse(
        'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/users/$usernameTemp.json');
    final response = await http.get(url);
    final value = jsonDecode(response.body);

    if (value == null) {
      return false;
    } else {
      final key = value.keys.first;
      if (passwordTemp != value['$key']['password']) {
        return false;
      } else {
        return true;
      }
    }
  }


}
