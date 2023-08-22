import 'package:flutter/material.dart';
import 'package:flutter_study/task5/repository_list_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      home: const RepositoryListPage(),
    );
  }
}