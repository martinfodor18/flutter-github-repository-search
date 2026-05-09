import '../../models/repository_model.dart';

abstract class RepositorySearchState {}

class RepositorySearchInitial extends RepositorySearchState {}

class RepositorySearchLoading extends RepositorySearchState {}

class RepositorySearchLoaded extends RepositorySearchState {
  final List<RepositoryModel> repositories;

  RepositorySearchLoaded(this.repositories);
}

class RepositorySearchError extends RepositorySearchState {
  final String message;

  RepositorySearchError(this.message);
}
