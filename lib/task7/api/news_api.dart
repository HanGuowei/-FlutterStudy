import 'package:flutter/material.dart';
import 'package:flutter_study/task5/utils/dio_util.dart';
import 'package:flutter_study/task7/model/news_result.dart';

const baseUrl = 'https://newsapi.org';

class NewsApi {
  final dio = createDio(baseUrl: baseUrl);

  Future<NewsResult?> getNewsList(
      String query,
      int page,
      int pageSize,
      ) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/v2/everything',
        queryParameters: {
          'q': query,
          'page': page,
          'pageSize': pageSize,
        },
      );
      return NewsResult.fromJson(response.data ?? <String, dynamic>{});
    } on Exception catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
