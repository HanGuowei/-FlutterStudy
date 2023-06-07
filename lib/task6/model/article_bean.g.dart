// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesBean _$ArticlesBeanFromJson(Map<String, dynamic> json) => ArticlesBean(
      source: json['source'] == null
          ? null
          : SourceBean.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ArticlesBeanToJson(ArticlesBean instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
