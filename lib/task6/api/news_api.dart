import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_study/task6/api/category.dart';
import 'package:flutter_study/task6/entity/news.dart';

class NewsApi {
  String api = 'https://newsapi.org';
  final dio = Dio()
    ..options.headers = {
      'X-Api-Key': dotenv.env['NEWS_API_KEY'],
    };

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
    Category? category,
    int page,
    int pageSize,
  ) async {
    final response = await dio.get<Map<String, dynamic>>(
      '$api/v2/top-headlines',
      queryParameters: {
        'q': q,
        'category': category?.name,
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
