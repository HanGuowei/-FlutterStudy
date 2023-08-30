import 'package:dio/dio.dart';

const String kBaseUrl = 'https://api.github.com';
const String kNewsApiKey = String.fromEnvironment('NEWS_API_KEY');

   Dio createDio({String? baseUrl, String? basePath,}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? kBaseUrl + (basePath ?? ''),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequest,
        onResponse: onResponse,
        onError: onError,
      ),
    );

    return dio;
  }

  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
     // github {'X-GitHub-Api-Version': '2022-11-28'}
    options.headers['X-Api-Key'] = kNewsApiKey;

    return handler.next(options);
  }

  void onResponse(
      Response<dynamic> response,
      ResponseInterceptorHandler handler,
      ) {
    return handler.next(response);
  }

  void onError(
      DioException e,
      ErrorInterceptorHandler handler,
      ) {
    return handler.reject(e);
  }
