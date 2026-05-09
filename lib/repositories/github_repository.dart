import '../models/repository_model.dart';
import '../services/github_api_service.dart';

class GithubRepository {
  final GithubApiService _apiService;

  GithubRepository(this._apiService);

  Future<List<RepositoryModel>> searchRepositories(String query) async {
    final response = await _apiService.searchRepositories(query);

    final items = response.data['items'] as List;

    return items.map((item) => RepositoryModel.fromJson(item)).toList();
  }
}
