import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/github_repository.dart';
import '../../utils/constants.dart';
import 'repository_search_event.dart';
import 'repository_search_state.dart';

class RepositorySearchBloc
    extends Bloc<RepositorySearchEvent, RepositorySearchState> {
  final GithubRepository repository;

  RepositorySearchBloc(this.repository) : super(RepositorySearchInitial()) {
    on<SearchRepositoriesRequested>(_onSearchRepositoriesRequested);
    on<LoadCachedRepositories>(_onLoadCachedRepositories);
  }

  Future<void> _onSearchRepositoriesRequested(
    SearchRepositoriesRequested event,
    Emitter<RepositorySearchState> emit,
  ) async {
    emit(RepositorySearchLoading());

    try {
      final repositories = await repository.searchRepositories(event.query);

      if (repositories.isEmpty) {
        emit(RepositorySearchError(Constants.noRepositoriesFoundMessage));

        return;
      }

      emit(RepositorySearchLoaded(repositories));
    } catch (e) {
      emit(RepositorySearchError(Constants.genericErrorMessage));
    }
  }

  Future<void> _onLoadCachedRepositories(
      LoadCachedRepositories event,
      Emitter<RepositorySearchState> emit,
      ) async {
    final repositories =
    await repository
        .getCachedRepositories();

    if (repositories.isNotEmpty) {
      emit(
        RepositorySearchLoaded(
          repositories,
        ),
      );
    }
  }
}
