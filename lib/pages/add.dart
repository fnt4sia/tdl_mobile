import 'package:flutter/material.dart';
import 'package:tdl/components/create_tdl.dart';
import 'package:tdl/components/navbar.dart';

class AddTDL extends StatelessWidget {
  const AddTDL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF11161C),
      body: ListView(
        children: const [
          NavbarAdd(),
          SizedBox(
            height: 40,
          ),
          FormTDL(),
        ],
      ),
    );
  }
}
