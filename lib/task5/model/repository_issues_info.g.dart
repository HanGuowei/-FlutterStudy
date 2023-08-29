// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_issues_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryIssuesInfo _$RepositoryIssuesInfoFromJson(
        Map<String, dynamic> json) =>
    RepositoryIssuesInfo(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      state: json['state'] as String?,
      comments: json['comments'] as int?,
    );

Map<String, dynamic> _$RepositoryIssuesInfoToJson(
        RepositoryIssuesInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comments': instance.comments,
      'title': instance.title,
      'body': instance.body,
      'state': instance.state,
    };
