import 'package:flutter_study/task5/model/repository_issues_info.dart';
import 'package:flutter_study/task5/model/repository_readme_info.dart';
import 'package:flutter_study/task5/model/repository_search_result.dart';
import 'package:flutter_study/task5/utils/dio_util.dart';

class GithubApi {
  final dio = createDio();

  Future<RepositorySearchResult> searchRepository(
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
    return RepositorySearchResult.fromJson(
        response.data ?? <String, dynamic>{},
        );
  }

  Future<RepositoryReadmeInfo> getRepositoryReadme(
      String fullName,
      ) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/repos/$fullName/readme',
    );
    return RepositoryReadmeInfo.fromJson(
        response.data ?? <String, dynamic>{},
    );
  }

  Future<List<RepositoryIssuesInfo>> getRepositoryIssues(
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
    return (response.data ?? [])
        .map((e) => RepositoryIssuesInfo.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
