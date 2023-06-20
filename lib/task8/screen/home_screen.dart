import 'package:flutter/material.dart';
import 'package:flutter_study/task8/screen/done_tasks_screen.dart';
import 'package:flutter_study/task8/screen/new_task_screen.dart';
import 'package:flutter_study/task8/screen/todo_tasks_screen.dart';

import '../widget/category_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTabIndex == 0 ? 'TO-DO' : 'DONE'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: FittedBox(
              child: CategorySelector(
                value: '仕事',
                categories: const ['仕事', '日常の雑務', '記念日の計画'],
                onChanged: (v) {},
              ),
            ),
          )
        ],
      ),
      floatingActionButton: _currentTabIndex == 0
          ? FloatingActionButton(
              onPressed: _navigateToNewTaskScreen,
              child: const Icon(Icons.add),
            )
          : null,
      body: Stack(
        children: [
          Offstage(
            offstage: _currentTabIndex != 0,
            child: const TodoTasksScreen(),
          ),
          Offstage(
            offstage: _currentTabIndex != 1,
            child: const DoneTasksScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'TODO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'DONE',
          ),
        ],
      ),
    );
  }

  void _navigateToNewTaskScreen() {
    Navigator.of(context).push(
      MaterialPageRoute<NewTaskScreen>(
        builder: (context) => const NewTaskScreen(),
      ),
    );
  }
}
