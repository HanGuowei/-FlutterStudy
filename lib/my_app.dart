import 'package:flutter/material.dart';
import 'package:flutter_study/task6/custom_tab_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task',
      home: CustomTabBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
