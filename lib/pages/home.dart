import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tdl/components/main_hi.dart';
import 'package:tdl/components/todo_list.dart';
import '../components/navbar.dart';
import '../data/user.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void todoIsDone(String id, bool currentIsDone) async {
    final url = Uri.parse(
        'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/todolist/$id.json');
    await http.patch(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'isDone': !currentIsDone,
        }));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: User.getData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return Scaffold(
              backgroundColor: const Color(0XFF11161C),
              body: SafeArea(
                child: ListView(
                  children: [
                    const NavbarHome(),
                    const SizedBox(
                      height: 20,
                    ),
                    const MainHi(),
                    const SizedBox(
                      height: 30,
                    ),
                    User.todoList.isNotEmpty
                        ? TodoList(
                            todoIsDone: todoIsDone,
                          )
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
