import 'package:flutter/material.dart';
import 'package:flutter_study/task4/scanner_screen.dart';

class Task4App extends StatelessWidget {
  const Task4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 4: Book Barcode Scan',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const ScannerScreen(),
    );
  }
}
