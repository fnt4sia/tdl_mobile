import 'package:flutter/material.dart';
import 'package:tdl/data/list.dart';
import '../components/navbar.dart';
import '../data/user.dart';

class EditTDL extends StatefulWidget {
  const EditTDL({super.key, required this.editTodo});
  final Todo editTodo;

  @override
  State<EditTDL> createState() => _EditTDLState();
}

class _EditTDLState extends State<EditTDL> {
  late TextEditingController titleController;
  late TextEditingController descController;
  String errorText = '';
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.editTodo.title);
    descController = TextEditingController(text: widget.editTodo.desc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF11161C),
      body: ListView(
        children: [
          NavDesc(id: widget.editTodo.id),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
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
                  controller: descController,
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
                          descController.text.isEmpty) {
                        setState(() {
                          errorText = 'Please Fill The Data';
                        });
                      } else {
                        await User.updateData(
                            titleController.text,
                            descController.text,
                            widget.editTodo.id,
                            widget.editTodo.isDone);
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
          )
        ],
      ),
    );
  }
}
