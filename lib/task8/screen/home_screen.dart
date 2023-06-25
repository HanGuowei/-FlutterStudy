import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task8/screen/new_task_screen.dart';
import 'package:flutter_study/task8/screen/todo_tasks_screen.dart';
import 'package:flutter_study/task8/state/tasks.dart';

import '../widget/category_selector.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isCompletedFilter = ref.watch(filterCompleteProvider);
    final categories = ref.watch(getTasksCategoriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(isCompletedFilter ? 'DONE' : 'TO-DO'),
        actions: [
          if (categories.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: FittedBox(
                child: CategorySelector(
                  value: categories.first,
                  categories: categories.toList(),
                  onChanged: (newCategory) {
                    ref.read(filterCategoryProvider.notifier).state =
                        newCategory;
                  },
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToNewTaskScreen,
        child: const Icon(Icons.add),
      ),
      body: const TodoTasksScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: isCompletedFilter ? 1 : 0,
        onTap: (index) {
          ref.read(filterCompleteProvider.notifier).state = index == 1;
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
