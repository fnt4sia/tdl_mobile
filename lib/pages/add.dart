import 'package:flutter/material.dart';
import 'package:tdl/components/create_tdl.dart';
import 'package:tdl/components/navbar.dart';
import '../data/list.dart';

class AddTDL extends StatelessWidget {
  const AddTDL({Key? key, required this.newListTodo}) : super(key: key);
  final List<Todo> newListTodo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF11161C),
      body: ListView(
        children: [
          const NavbarAdd(),
          const SizedBox(
            height: 40,
          ),
          FormTDL(newListTodo: newListTodo),
        ],
      ),
    );
  }
}
