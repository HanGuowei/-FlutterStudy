import 'package:dio/dio.dart';
import 'package:flutter_study/task6/entity/news.dart';

class NewsApi {
  String api = 'https://newsapi.org';
  final dio = Dio()
    ..options.headers = {'X-Api-Key': '0b99e4557cbd4f3f85e11cddde8a38a9'};

  Future<News> everything(
    String query,
    int page,
    int pageSize,
  ) async {
    final response = await dio.get<Map<String, dynamic>>(
      '$api/v2/everything',
      queryParameters: {
        'q': query,
        'page': page,
        'pageSize': pageSize,
      },
    );
    return News.fromJson(response.data!);
  }

  Future<News> topHeadlines(
    String q,
    String? category,
    int page,
    int pageSize,
  ) async {
    final response = await dio.get<Map<String, dynamic>>(
      '$api/v2/top-headlines',
      queryParameters: {
        'q': q,
        'category': category,
        'page': page,
        'pageSize': pageSize,
      },
    );
    return News.fromJson(response.data!);
  }
}

enum SearchIn { title, description, content }

enum Language { ar, de, en, es, fr, he, it, nl, no, pt, ru, sv, zh }

enum SortBy {
  relevancy,
  popularity,
  publishedAt,
}
