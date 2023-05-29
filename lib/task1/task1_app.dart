import 'package:flutter/material.dart';

import 'counter_screen.dart';

class Task1App extends StatelessWidget {
  const Task1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 1: Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task 1: Counter App'),
        ),
        body: const CounterScreen(),
      ),
    );
  }
}
