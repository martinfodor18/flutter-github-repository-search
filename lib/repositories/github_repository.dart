import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/repository_model.dart';
import '../services/github_api_service.dart';

class GithubRepository {
  static const String _cacheKey = 'cached_repositories';

  final GithubApiService _apiService;

  GithubRepository(this._apiService);

  Future<List<RepositoryModel>> searchRepositories(String query) async {
    final response = await _apiService.searchRepositories(query);

    final items = response.data['items'] as List;

    final repositories = items
        .map((item) => RepositoryModel.fromJson(item))
        .toList();

    await _saveRepositoriesToCache(repositories);

    return repositories;
  }

  Future<void> _saveRepositoriesToCache(
    List<RepositoryModel> repositories,
  ) async {
    final preferences = await SharedPreferences.getInstance();

    final jsonList = repositories
        .map((repository) => repository.toJson())
        .toList();

    await preferences.setString(_cacheKey, jsonEncode(jsonList));
  }

  Future<List<RepositoryModel>> getCachedRepositories() async {
    final preferences = await SharedPreferences.getInstance();

    final cachedData = preferences.getString(_cacheKey);

    if (cachedData == null) {
      return [];
    }

    final decoded = jsonDecode(cachedData) as List;

    return decoded.map((item) => RepositoryModel.fromJson(item)).toList();
  }
}
