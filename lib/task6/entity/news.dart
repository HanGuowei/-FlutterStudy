import 'package:json_annotation/json_annotation.dart';

import 'article_info.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  final String status;
  final int totalResults;
  final List<ArticleInfo> articles;
}
