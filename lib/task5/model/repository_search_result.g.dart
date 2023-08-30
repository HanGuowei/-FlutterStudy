// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositorySearchResult _$RepositorySearchResultFromJson(
        Map<String, dynamic> json) =>
    RepositorySearchResult(
      items: (json['items'] as List<dynamic>)
          .map((e) => RepositoryInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepositorySearchResultToJson(
        RepositorySearchResult instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

RepositoryInfo _$RepositoryInfoFromJson(Map<String, dynamic> json) =>
    RepositoryInfo(
      id: json['id'] as int?,
      name: json['name'] as String?,
      fullName: json['fullName'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$RepositoryInfoToJson(RepositoryInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'description': instance.description,
    };
