import 'package:flutter/material.dart';
import '../data/user.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordHidden = true;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              fillColor: Color(0XFF192028),
              filled: true,
              hintText: 'Username',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 129, 129, 129),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
            obscureText: passwordHidden,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => {
                  setState(() {
                    passwordHidden = !passwordHidden;
                  })
                },
                color: Colors.white,
                icon: passwordHidden
                    ? const Icon(Icons.key_off)
                    : const Icon(Icons.key),
              ),
              fillColor: const Color(0XFF192028),
              filled: true,
              hintText: 'Password',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 129, 129, 129),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          errorMessage.isNotEmpty
              ? Column(
                  children: [
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          InkWell(
            onTap: () async {
              if (usernameController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                setState(() {
                  errorMessage = "Please Fill The Data";
                });
              } else {
                var navigator = Navigator.of(context);
                if (await User.tryLogin(
                    usernameController.text, passwordController.text)) {
                  User.isLoggedIn = true;
                  User.username = usernameController.text;
                  User.password = passwordController.text;
                  navigator.pushReplacementNamed('/home');
                } else {
                  setState(() {
                    errorMessage = "Wrong Username Or Password";
                  });
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String errorMessage = '';
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passwordHidden = true;
  bool confirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              fillColor: Color(0XFF192028),
              filled: true,
              hintText: 'Username',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 129, 129, 129),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
            style: const TextStyle(
              color: Colors.white,
            ),
            obscureText: passwordHidden,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => {
                  setState(() {
                    passwordHidden = !passwordHidden;
                  })
                },
                color: Colors.white,
                icon: passwordHidden
                    ? const Icon(Icons.key_off)
                    : const Icon(Icons.key),
              ),
              fillColor: const Color(0XFF192028),
              filled: true,
              hintText: 'Password',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 129, 129, 129),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: confirmPasswordController,
            style: const TextStyle(
              color: Colors.white,
            ),
            obscureText: confirmPasswordHidden,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => {
                  setState(() {
                    confirmPasswordHidden = !confirmPasswordHidden;
                  })
                },
                color: Colors.white,
                icon: confirmPasswordHidden
                    ? const Icon(Icons.key_off)
                    : const Icon(Icons.key),
              ),
              fillColor: const Color(0XFF192028),
              filled: true,
              hintText: 'Confirm Password',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 129, 129, 129),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          errorMessage.isNotEmpty
              ? Column(
                  children: [
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          InkWell(
            onTap: () async {
              if (usernameController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                setState(() {
                  errorMessage = "Please Fill The Data";
                });
              } else if (passwordController.text !=
                  confirmPasswordController.text) {
                setState(() {
                  errorMessage = "Your Password Is Not The Same";
                });
              } else {
                var navigator = Navigator.of(context);
                if (await User.userRegistered(usernameController.text)) {
                  setState(() {
                    errorMessage = "Username Has Been Used";
                  });
                } else {
                  bool register = await User.tryRegister(
                      usernameController.text, passwordController.text);
                  if (register) {
                    User.isLoggedIn = true;
                    User.username = usernameController.text;
                    User.password = passwordController.text;
                    navigator.pushReplacementNamed('/home');
                  } else {
                    setState(() {
                      errorMessage = "Error To Register";
                    });
                  }
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
