import 'package:flutter/material.dart';
import '../data/user.dart';
import 'package:intl/intl.dart';

class MainHi extends StatefulWidget {
  const MainHi({super.key});

  @override
  State<MainHi> createState() => _MainHiState();
}

class _MainHiState extends State<MainHi> {
  final DateTime date = DateTime.now();
  String getMonth() => DateFormat('MMMM').format(date);
  String getDay() => DateFormat('EEEE').format(date);
  double progress = 1;

  @override
  void initState() {
    super.initState();

    if (User.listTodo.isNotEmpty) {
      setState(() {
        progress = User.listTodo.where((data) => data.isDone == true).length /
            User.listTodo.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0XFF1464C7),
              Color(0xff4CC0EE),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${getDay()}, ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      letterSpacing: 1,
                      color: Colors.white),
                ),
                Text(
                  '${date.day} ${getMonth()} ${date.year}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${User.username}!',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'You Have ${User.listTodo.where((element) => element.isDone == false).length} Tasks Left',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Progress',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${(progress * 100).floor().toString()}%',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0XFF7AAFE3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.bottomLeft,
                          widthFactor: progress,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'a',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
