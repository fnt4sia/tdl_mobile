import 'package:http/http.dart' as http;
import '../data/list.dart';
import 'dart:convert';

class User {
  static String username = '';
  static String password = '';
  static bool isLoggedIn = false;
  static List<Todo> todoList = [];

  static Future<bool> tryRegister(
      String usernameTemp, String passwordTemp) async {
    final url = Uri.parse(
      'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/users.json',
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
        'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/users.json');
    final response = await http.get(url);
    final value = jsonDecode(response.body);
    if (value == null) {
      return false;
    } else {
      final listValue = value.values.toList();
      for (int i = 0; i < listValue.length; i++) {
        if (listValue[i]['username'] == usernameTemp) {
          return true;
        }
      }
      return false;
    }
  }

  static Future<bool> tryLogin(String usernameTemp, String passwordTemp) async {
    final url = Uri.parse(
        'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/users.json');
    final response = await http.get(url);
    final value = jsonDecode(response.body).values.toList();

    if (value == null) {
      return false;
    } else {
      for (int i = 0; i < value.length; i++) {
        if (value[i]['username'] == usernameTemp &&
            value[i]['password'] == passwordTemp) {
          return true;
        }
      }
      return false;
    }
  }

  static Future<void> getData() async {
    final newUrl = Uri.parse(
        'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/todolist.json');
    final newResponse = await http.get(newUrl);
    final data = await jsonDecode(newResponse.body);

    User.todoList = [];

    data.entries.forEach((newData) {
      if (User.username == newData.value['username']) {
        User.todoList.add(Todo(
            id: newData.key,
            title: newData.value['title'],
            desc: newData.value['desc'],
            isDone: newData.value['isDone']));
      }
    });
  }

  static Future<void> addData(
      String title, String desc, String username) async {
    final url = Uri.parse(
        'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/todolist.json');
    await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'desc': desc,
        'isDone': false,
        'username': username,
      }),
    );
  }
}
