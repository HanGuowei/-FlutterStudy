import 'package:json_annotation/json_annotation.dart';

import 'article_bean.dart';

part 'news_bean.g.dart';

@JsonSerializable()
class NewsBean {
  NewsBean({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsBean.fromJson(Map<String, dynamic> json) =>
      _$NewsBeanFromJson(json);

  final String status;
  final int totalResults;
  final List<ArticlesBean> articles;
}
