import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task8/state/tasks.dart';
import 'package:flutter_study/task8/util/formDateTime.dart';

import '../model/task.dart';
import '../screen/task_detail_screen.dart';

class TaskItem extends ConsumerStatefulWidget {
  const TaskItem({super.key, required this.task});

  final Task task;

  @override
  ConsumerState<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends ConsumerState<TaskItem> {
  @override
  Widget build(BuildContext context) {
    final tasksNotifier = ref.read(tasksProvider.notifier);
    return Card(
      child: ListTile(
        title: Text(widget.task.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.task.description),
            if (!widget.task.isCompleted)
              (widget.task.dueDate.isAfter(DateTime.timestamp()))
                  ? Text(
                      'Expires on ${widget.task.dueDate.formatDateTime()}',
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  : Text(
                      'Expired',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Colors.red),
                    )
          ],
        ),
        onTap: () {
          _navigateToDetail(widget.task);
        },
        trailing: (widget.task.isCompleted)
            ? IconButton(
                onPressed: () {
                  tasksNotifier.toggleTask(widget.task.id!);
                },
                icon: const Icon(Icons.check_box, color: Colors.green),
              )
            : IconButton(
                onPressed: () {
                  tasksNotifier.toggleTask(widget.task.id!);
                },
                icon: const Icon(Icons.check_box_outline_blank),
              ),
      ),
    );
  }

  void _navigateToDetail(Task task) {
    Navigator.push(
      context,
      MaterialPageRoute<TaskDetailScreen>(
        builder: (context) => TaskDetailScreen(task: task),
      ),
    );
  }
}
