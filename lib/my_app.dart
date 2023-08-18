import 'package:flutter/material.dart';
import 'package:flutter_study/task1/home_page.dart';
import 'package:flutter_study/task2/todo_list_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      home: const TodoListPage(),
    );
  }
}