import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task8/state/tasks.dart';
import 'package:flutter_study/task8/widget/task_item.dart';

class TodoTasksScreen extends ConsumerStatefulWidget {
  const TodoTasksScreen({super.key});

  @override
  ConsumerState<TodoTasksScreen> createState() => _TodoTasksScreenState();
}

class _TodoTasksScreenState extends ConsumerState<TodoTasksScreen> {
  @override
  Widget build(BuildContext context) {
    final filterTasks = ref.watch(getFilterTasksProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: filterTasks.length,
        itemBuilder: (context, index) {
          return TaskItem(task: filterTasks[index]);
        },
      ),
    );
  }
}
