import 'package:flutter/material.dart';
import 'package:flutter_study/task8/util/formDateTime.dart';

import '../model/task.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key, required this.task});

  final Task task;

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _detailItemBuild('Title', widget.task.title),
            _detailItemBuild('Description', widget.task.description),
            _detailItemBuild('Category', widget.task.category),
            _detailItemBuild('Due Date', widget.task.dueDate.formatDateTime()),
            _detailItemBuild(
              'Complete Status',
              widget.task.isCompleted ? 'Completed' : 'Not Completed',
            ),
            if (widget.task.completedAt != null)
              _detailItemBuild(
                'Completed At',
                widget.task.completedAt!.formatDateTime(),
              ),
            _detailItemBuild('ID', widget.task.id!),
          ],
        ),
      ),
    );
  }

  Widget _detailItemBuild(String title, String content) {
    final titleTextStyle = Theme.of(context).textTheme.titleMedium;
    final contentTextStyle = Theme.of(context).textTheme.bodyMedium;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleTextStyle,
          ),
          Text(
            content,
            style: contentTextStyle,
          ),
        ],
      ),
    );
  }
}
