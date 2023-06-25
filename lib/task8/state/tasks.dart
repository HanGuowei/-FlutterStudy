import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task8/model/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'tasks.g.dart';

const _key = 'tasks';

@riverpod
Future<SharedPreferences> getSharedPreferences(
  GetSharedPreferencesRef ref,
) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

@riverpod
class Tasks extends _$Tasks {
  final _uuid = const Uuid();

  @override
  List<Task> build() {
    final prefs = ref.watch(getSharedPreferencesProvider);
    final list = prefs.value
            ?.getStringList(_key)
            ?.map((e) => Task.fromJson(json.decode(e) as Map<String, dynamic>))
            .toList() ??
        [];
    return list;
  }

  Future<void> addTask(Task task) async {
    final newList = [...state, task.copyWith(id: _uuid.v4())];
    await _modifierState(newList);
  }

  Future<void> deleteTask(String id) async {
    final newList = [
      for (final t in state)
        if (t.id != id) t
    ];
    await _modifierState(newList);
  }

  Future<void> toggleTask(String id) async {
    final modifierList = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(
            isCompleted: !todo.isCompleted,
            completedAt: DateTime.timestamp(),
          )
        else
          todo,
    ];
    await _modifierState(modifierList);
  }

  Future<void> _modifierState(List<Task> newList) async {
    final jsonList = newList.map((e) => json.encode(e.toJson())).toList();
    final isSuccess = await ref
        .watch(getSharedPreferencesProvider)
        .value
        ?.setStringList(_key, jsonList);
    if (isSuccess != null && isSuccess) {
      state = newList;
    }
  }
}

@riverpod
Set<String> getTasksCategories(GetTasksCategoriesRef ref) {
  return ref.watch(tasksProvider).map((e) => e.category).toSet();
}

final filterCategoryProvider = StateProvider<String?>((ref) => null);
final filterCompleteProvider = StateProvider<bool>((ref) => false);

@riverpod
List<Task> getFilterTasks(GetFilterTasksRef ref) {
  final tasks = ref.watch(tasksProvider);
  final filterCategory = ref.watch(filterCategoryProvider);
  final filterComplete = ref.watch(filterCompleteProvider);
  final filterCompleteResult =
      tasks.where((element) => element.isCompleted == filterComplete);
  if (filterCategory == null) {
    return filterCompleteResult.toList();
  } else {
    return filterCompleteResult
        .where((element) => element.category == filterCategory)
        .toList();
  }
}
