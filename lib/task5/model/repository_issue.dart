import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_issue.freezed.dart';
part 'repository_issue.g.dart';

@freezed
class RepositoryIssue with _$RepositoryIssue {
  const factory RepositoryIssue({
    required int id,
    required String? title,
    required String? body,
    required String state,
    required int comments,
  }) = _RepositoryIssue;

  factory RepositoryIssue.fromJson(Map<String, dynamic> json) =>
      _$RepositoryIssueFromJson(json);
}
