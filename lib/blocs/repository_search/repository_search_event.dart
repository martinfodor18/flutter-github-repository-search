abstract class RepositorySearchEvent {}

class SearchRepositoriesRequested extends RepositorySearchEvent {
  final String query;

  SearchRepositoriesRequested(this.query);
}
