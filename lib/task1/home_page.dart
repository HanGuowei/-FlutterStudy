import 'package:flutter/material.dart';

const String questionTitle = '課題1.ボタンを押すとカウントアップされるシンプルなカウンターアプリを作成する';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _count = 0;

  void _incrementCount() {
    setState(() {
      _count ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task 1',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              questionTitle,
            ),
            const SizedBox(
              height: 40,
            ),
            // count
            Text(
              _count.toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            // + button
            FloatingActionButton(
              onPressed: _incrementCount,
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
