import 'package:flutter/material.dart';
import '../components/form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFF11161C),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15,
          ),
          decoration: const BoxDecoration(
            color: Color(0XFF11161C),
          ),
          child: Center(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 70,
                      height: 70,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'TORA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: const LoginForm(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 129, 129, 129),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: const Text(
                        ' SIGN UP',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'OR',
                  style: TextStyle(
                    color: Color.fromARGB(255, 129, 129, 129),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => {},
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0XFF11161C),
                        ),
                        elevation: MaterialStatePropertyAll(0),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide.none,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            'https://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19753.png',
                            width: 40,
                            height: 40,
                          ),
                          const Text(
                            'Facebook',
                            style: TextStyle(
                              color: Color.fromARGB(255, 129, 129, 129),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {},
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0XFF11161C),
                        ),
                        elevation: MaterialStatePropertyAll(0),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide.none,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            'http://pngimg.com/uploads/google/google_PNG19635.png',
                            width: 40,
                            height: 40,
                          ),
                          const Text(
                            'Google',
                            style: TextStyle(
                              color: Color.fromARGB(255, 129, 129, 129),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
