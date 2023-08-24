import 'package:json_annotation/json_annotation.dart';
part 'repository_issues_info.g.dart';

@JsonSerializable()
class RepositoryIssuesInfo {

  RepositoryIssuesInfo({
    this.id,
    this.title,
    this.body,
    this.state,
    this.comments,
  });

  factory RepositoryIssuesInfo.fromJson(Map<String, dynamic> json)
  => _$RepositoryIssuesInfoFromJson(json);

  final int? id;
  final int? comments;
  final String? title;
  final String? body;
  final String? state;

  Map<String, dynamic> toJson() => _$RepositoryIssuesInfoToJson(this);
}
