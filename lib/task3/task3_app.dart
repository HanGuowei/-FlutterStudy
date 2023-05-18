import 'package:flutter/material.dart';
import 'package:flutter_study/task3/stopwatch_screen.dart';

class Task3App extends StatelessWidget {
  const Task3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 3: Stopwatch',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task 3: Stopwatch'),
        ),
        body: const StopwatchScreen(),
      ),
    );
  }
}
