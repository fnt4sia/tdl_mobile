import 'package:flutter/material.dart';
import '../data/user.dart';

class NavbarHome extends StatelessWidget {
  const NavbarHome({super.key});

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
              User.todoList = [];
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
              Navigator.pushNamed(context, '/add');
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

class NavDesc extends StatelessWidget {
  const NavDesc({super.key, required this.id});
  final String id;

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
              color: Colors.transparent,
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
            onPressed: () async {
              var navigator = Navigator.of(context);
              await User.deleteData(id);
              navigator.pushReplacementNamed('/home');
            },
            icon: const Icon(Icons.delete_outline),
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
