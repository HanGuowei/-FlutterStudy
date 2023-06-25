import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
@immutable
class Task {
  const Task(
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.dueDate,
    this.category, {
    this.isCompleted = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  final String? id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  final DateTime dueDate;
  final String category;

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    DateTime? dueDate,
    String? category,
  }) {
    return Task(
      id ?? this.id,
      title ?? this.title,
      description ?? this.description,
      createdAt ?? this.createdAt,
      updatedAt ?? this.updatedAt,
      completedAt ?? this.completedAt,
      dueDate ?? this.dueDate,
      category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
