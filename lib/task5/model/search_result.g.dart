// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResult _$$_SearchResultFromJson(Map<String, dynamic> json) =>
    _$_SearchResult(
      items: (json['items'] as List<dynamic>)
          .map((e) => RepositoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchResultToJson(_$_SearchResult instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$_RepositoryItem _$$_RepositoryItemFromJson(Map<String, dynamic> json) =>
    _$_RepositoryItem(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['fullName'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_RepositoryItemToJson(_$_RepositoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'description': instance.description,
    };
