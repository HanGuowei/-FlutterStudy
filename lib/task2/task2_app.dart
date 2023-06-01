import 'package:flutter/material.dart';
import 'package:flutter_study/task2/todo_list_screen.dart';

class Task2App extends StatelessWidget {
  const Task2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 2: Todo List',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task 2: Todo List'),
        ),
        body: const TodoListScreen(),
      ),
    );
  }
}
