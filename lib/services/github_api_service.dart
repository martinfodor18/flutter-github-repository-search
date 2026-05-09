import 'package:dio/dio.dart';

import '../utils/constants.dart';

class GithubApiService {
  final Dio _dio;

  GithubApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: Constants.githubBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  Future<Response> searchRepositories(String query) async {
    return await _dio.get(
      '/search/repositories',
      queryParameters: {'q': query},
    );
  }
}
