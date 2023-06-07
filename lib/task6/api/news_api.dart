import 'package:dio/dio.dart';
import 'package:flutter_study/task6/model/news_bean.dart';

class NewsApi {
  String api = 'https://newsapi.org';
  final dio = Dio()
    ..options.headers = {"X-Api-Key": "0b99e4557cbd4f3f85e11cddde8a38a9"};

  Future<NewsBean> everything(
    String query,
    List<SearchIn> searchIn,
    Language language,
    int page,
    int pageSize,
  ) async {
    final response = await dio.get<Map<String, dynamic>>(
      '$api/v2/everything',
      queryParameters: {
        'q': query,
        'qInTitle': searchIn.map((e) => e.name).join(','),
        'language': language.name,
        'page': page,
        'pageSize': pageSize,
      },
    );
    return NewsBean.fromJson(response.data!);
  }
}

enum SearchIn { title, description, content }

enum Language { ar, de, en, es, fr, he, it, nl, no, pt, ru, sv, zh }

enum SortBy {
  relevancy,
  popularity,
  publishedAt,
}
