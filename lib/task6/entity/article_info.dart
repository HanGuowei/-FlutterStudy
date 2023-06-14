import 'package:flutter_study/task6/entity/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_info.g.dart';

@JsonSerializable()
class ArticleInfo {
  ArticleInfo({
    this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleInfo.fromJson(Map<String, dynamic> json) =>
      _$ArticleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleInfoToJson(this);

  final Source? source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;
}
