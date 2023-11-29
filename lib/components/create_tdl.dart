import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tdl/data/list.dart';
import '../data/user.dart';
import 'package:http/http.dart' as http;

class FormTDL extends StatefulWidget {
  const FormTDL({Key? key, required this.newListTodo}) : super(key: key);
  final List<Todo> newListTodo;

  @override
  State<FormTDL> createState() => _FormTDLState();
}

class _FormTDLState extends State<FormTDL> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Task Name',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: titleController,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              fillColor: Color(0XFF192028),
              filled: true,
              hintText: 'Add Your Title',
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
            height: 15,
          ),
          const Text(
            'Description',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: descriptionController,
            minLines: 4,
            maxLines: null,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              fillColor: Color(0XFF192028),
              filled: true,
              hintText: 'Add Your Descsription',
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
            height: 20,
          ),
          errorText.isNotEmpty
              ? Column(
                  children: [
                    Text(errorText,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                )
              : const SizedBox.shrink(),
          Center(
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.blue,
                ),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                ),
              ),
              onPressed: () async {
                var navigator = Navigator.of(context);
                if (titleController.text.isEmpty ||
                    descriptionController.text.isEmpty) {
                  setState(() {
                    errorText = 'Please Fill The Data';
                  });
                } else {
                  setState(() {
                    widget.newListTodo.add(Todo(
                      title: titleController.text,
                      desc: descriptionController.text,
                      isDone: false,
                    ));
                  });

                  final getUrl = Uri.parse(
                      'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/users/${User.username}.json');
                  final getResponse = await http.get(getUrl);
                  final getData = jsonDecode(getResponse.body);
                  final key = getData.keys.first;

                  final url = Uri.parse(
                      'https://tdl-mobile-64246-default-rtdb.asia-southeast1.firebasedatabase.app/users/${User.username}/$key.json');
                  await http.patch(url,
                      body: jsonEncode({
                        'todolist': widget.newListTodo
                            .map((data) => {
                                  'title': data.title,
                                  'desc': data.desc,
                                  'isDone': data.isDone,
                                })
                            .toList(),
                      }));
                  navigator.pushReplacementNamed('/home');
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
