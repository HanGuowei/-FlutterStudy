import 'package:flutter/material.dart';
import 'package:flutter_study/task5/search_screen.dart';

class Task5App extends StatelessWidget {
  const Task5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 5: Github API',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const SearchScreen(),
    );
  }
}
