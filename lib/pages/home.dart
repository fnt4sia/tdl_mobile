import 'package:flutter/material.dart';
import 'package:tdl/components/main_hi.dart';
import 'package:tdl/components/todo_list.dart';
import '../components/navbar.dart';
import '../data/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: User.getData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show a loading spinner while waiting
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
                    MainHi(),
                    const SizedBox(
                      height: 30,
                    ),
                    User.listTodo.isNotEmpty
                        ? const TodoList()
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