import 'package:flutter/material.dart';
import 'package:flutter_study/task5/repository_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task',
      home: RepositoryListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
