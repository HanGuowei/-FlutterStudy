// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleInfo _$ArticleInfoFromJson(Map<String, dynamic> json) => ArticleInfo(
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['url_to_image'] as String?,
      publishedAt: json['published_at'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ArticleInfoToJson(ArticleInfo instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'url_to_image': instance.urlToImage,
      'published_at': instance.publishedAt,
      'content': instance.content,
    };
