import 'package:flutter/material.dart';
import 'package:tdl/pages/add.dart';
import '../data/user.dart';
import '../data/list.dart';

class NavbarHome extends StatelessWidget {
  const NavbarHome({Key? key, required this.newListTodo}) : super(key: key);
  final List<Todo> newListTodo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {
              User.username = '';
              User.password = '';
              User.isLoggedIn = false;
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(
              Icons.logout_outlined,
            ),
            color: Colors.white,
          ),
        ),
        const Expanded(
          flex: 3,
          child: Text(
            'Homepage',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTDL(newListTodo: newListTodo)));
            },
          ),
        )
      ],
    );
  }
}

class NavbarAdd extends StatelessWidget {
  const NavbarAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        const Expanded(
          flex: 3,
          child: Text(
            'Create New Task',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        )
      ],
    );
  }
}
