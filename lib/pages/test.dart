import 'dart:convert';

import '../data/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            final url = Uri.parse(
                'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/list.json');
            final response = await http.post(url,
                headers: {'Content-Type': 'application/json'},
                body: jsonEncode(User.listTodo
                    .map((data) => {
                          'title': data.title,
                          'desc': data.desc,
                          'isDone': data.isDone,
                        })
                    .toList()));
            if (response.statusCode == 200) {
              print('success');
            } else {
              print('no');
            }
          },
          child: const Text('Press Me'),
        ),
      ),
    );
  }
}
