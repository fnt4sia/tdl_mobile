import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tdl/components/main_hi.dart';
import 'package:tdl/components/todo_list.dart';
import '../components/navbar.dart';
import '../data/user.dart';
import '../data/list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> newListTodo = [];

  Future<void> getData() async {
    final newUrl = Uri.parse(
        'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/users/${User.username}.json');
    final newResponse = await http.get(newUrl);
    final data = jsonDecode(newResponse.body);
    if (data[data.keys.first]['todolist'] != null) {
      newListTodo = (data[data.keys.first]['todolist'] as List).map((data) {
        return Todo(
          title: data['title'],
          desc: data['desc'],
          isDone: data['isDone'],
        );
      }).toList();
    }
  }

  void todoIsDone(int index) {
    setState(() {
      newListTodo[index].isDone = !newListTodo[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show a loading spinner while waiting
          } else {
            return Scaffold(
              backgroundColor: const Color(0XFF11161C),
              body: SafeArea(
                child: ListView(
                  children: [
                    NavbarHome(newListTodo: newListTodo),
                    const SizedBox(
                      height: 20,
                    ),
                    MainHi(newListTodo: newListTodo),
                    const SizedBox(
                      height: 30,
                    ),
                    newListTodo.isNotEmpty
                        ? TodoList(newListTodo: newListTodo)
                        : const Center(
                            child: Text(
                              'You Dont Have List Yet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
