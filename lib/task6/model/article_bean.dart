import 'package:flutter_study/task6/model/source_bean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_bean.g.dart';

@JsonSerializable()
class ArticlesBean {
  ArticlesBean({
    this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticlesBean.fromJson(Map<String, dynamic> json) =>
      _$ArticlesBeanFromJson(json);

  final SourceBean? source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String content;
}
