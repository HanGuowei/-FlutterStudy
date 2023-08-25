import 'package:json_annotation/json_annotation.dart';
import 'article_info.dart';

part 'news_result.g.dart';

@JsonSerializable()
class NewsResult {
  NewsResult({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsResult.fromJson(Map<String, dynamic> json) =>
      _$NewsResultFromJson(json);

  final String? status;
  final int? totalResults;
  final List<ArticleInfo>? articles;
}
