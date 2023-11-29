import 'package:flutter/material.dart';
import 'package:tdl/pages/add.dart';
import 'package:tdl/pages/home.dart';
import 'package:tdl/pages/login.dart';
import 'package:tdl/pages/register.dart';
import 'package:tdl/pages/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tora',
      theme: ThemeData(),
      initialRoute: '/login',
      routes: {
        '/test': (context) => const TestPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/add': (context) => const AddTDL(),
      },
    );
  }
}
