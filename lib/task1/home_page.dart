import 'package:flutter/material.dart';

const String questionTitle = '課題1.ボタンを押すとカウントアップされるシンプルなカウンターアプリを作成する';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
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
        title: Text(
          'Task 1',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questionTitle,
            ),
            SizedBox(
              height: 40,
            ),
            // count
            Text(
              _count.toString(),
            ),
            SizedBox(
              height: 10,
            ),
            // + button
            FloatingActionButton(
              onPressed: _incrementCount,
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}