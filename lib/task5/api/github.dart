import 'package:dio/dio.dart';
import 'package:flutter_study/task5/model/repository_issue.dart';
import 'package:flutter_study/task5/model/search_result.dart';

import '../model/repository_readme.dart';

class GithubApi {
  static const String baseUrl = 'https://api.github.com';

  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'X-GitHub-Api-Version': '2022-11-28',
      },
    );

  Future<RepositoryItem> getRepository(String fullName) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/repos/$fullName',
    );
    return RepositoryItem.fromJson(response.data!);
  }

  Future<SearchResult> searchRepository(
    String keyword,
    int page,
    int perPage,
  ) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/search/repositories?q=$keyword',
      queryParameters: {
        'page': page,
        'per_page': perPage,
      },
    );
    return SearchResult.fromJson(response.data!);
  }

  Future<RepositoryReadme> getRepositoryReadme(String fullName) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/repos/$fullName/readme',
    );
    return RepositoryReadme.fromJson(response.data!);
  }

  Future<List<RepositoryIssue>> getRepositoryIssues(
    String fullName,
    int page,
    int perPage,
  ) async {
    final response = await dio.get<List<dynamic>>(
      '/repos/$fullName/issues',
      queryParameters: {
        'page': page,
        'per_page': perPage,
      },
    );
    return response.data!
        .map((e) => RepositoryIssue.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
