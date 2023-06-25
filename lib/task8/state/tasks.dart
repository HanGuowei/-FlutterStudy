import 'package:flutter_study/task8/model/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'tasks.g.dart';

@riverpod
class Tasks extends _$Tasks {
  final _uuid = const Uuid();

  @override
  List<Task> build() {
    return [];
  }

  void addTask(Task task) {
    state = [...state, task.copyWith(id: _uuid.v4())];
  }

  void deleteTask(String id) {
    state = [
      for (final t in state)
        if (t.id != id) t
    ];
  }

  void toggleTask(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }
}
