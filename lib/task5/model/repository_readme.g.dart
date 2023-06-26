// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_readme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepositoryReadme _$$_RepositoryReadmeFromJson(Map<String, dynamic> json) =>
    _$_RepositoryReadme(
      name: json['name'] as String,
      path: json['path'] as String,
      sha: json['sha'] as String,
      size: json['size'] as int,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      gitUrl: json['git_url'] as String,
      downloadUrl: json['download_url'] as String,
      type: json['type'] as String,
      content: json['content'] as String,
      encoding: json['encoding'] as String,
    );

Map<String, dynamic> _$$_RepositoryReadmeToJson(_$_RepositoryReadme instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'sha': instance.sha,
      'size': instance.size,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'git_url': instance.gitUrl,
      'download_url': instance.downloadUrl,
      'type': instance.type,
      'content': instance.content,
      'encoding': instance.encoding,
    };
