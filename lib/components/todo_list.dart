import 'package:flutter/material.dart';
import '../data/user.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key, required this.todoIsDone}) : super(key: key);
  final Function todoIsDone;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Task",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
              children: User.todoList.map((todo) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      widget.todoIsDone(todo.id, todo.isDone);
                    },
                    icon: Icon(
                      todo.isDone
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      size: 32,
                    ),
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          todo.desc.length > 20
                              ? '${todo.desc.substring(0, 30)}...'
                              : todo.desc,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.navigate_next_sharp,
                    color: Colors.white,
                    size: 32,
                  )
                ],
              ),
            );
          }).toList()),
        ],
      ),
    );
  }
}
