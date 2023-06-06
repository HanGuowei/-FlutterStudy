import 'package:dio/dio.dart';
import 'package:flutter_study/task6/model/article_bean.dart';

class NewsApi {
  String api = 'https://newsapi.org';
  final dio = Dio();

  Future<ArticlesBean?> everything(
    String query,
    List<SearchIn> searchIn,
    String sources,
    DateTime from,
    DateTime to,
    Language language,
    int page,
    int pageSize,
  ) async {
    final response = await dio.get<ArticlesBean>(
      '$api/v2/everything',
      queryParameters: {
        'q': query,
        'qInTitle': searchIn.map((e) => e.name).join(','),
        'sources': sources,
        'from': from.toIso8601String(),
        'to': to.toIso8601String(),
        'language': language.name,
        'page': page,
        'pageSize': pageSize,
      },
    );
    return response.data;
  }
}

enum SearchIn { title, description, content }

enum Language { ar, de, en, es, fr, he, it, nl, no, pt, ru, sv, zh }

enum SortBy {
  relevancy,
  popularity,
  publishedAt,
}
