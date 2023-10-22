import 'package:flutter/material.dart';

import '../utils/routes.dart';

class TodoList extends StatefulWidget {
  static const routeName = Routes.todoList;
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lista de tarefas',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
