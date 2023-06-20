import 'package:flutter/material.dart';
import 'package:flutter_study/task8/screen/home_screen.dart';

class Task8App extends StatelessWidget {
  const Task8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 8: Task APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
