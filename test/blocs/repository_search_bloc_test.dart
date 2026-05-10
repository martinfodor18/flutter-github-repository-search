import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_github_repository_search/blocs/repository_search/repository_search_bloc.dart';
import 'package:flutter_github_repository_search/blocs/repository_search/repository_search_event.dart';
import 'package:flutter_github_repository_search/blocs/repository_search/repository_search_state.dart';

import 'package:flutter_github_repository_search/models/repository_model.dart';
import 'package:flutter_github_repository_search/repositories/github_repository.dart';

class MockGithubRepository extends Mock implements GithubRepository {}

void main() {
  late MockGithubRepository mockRepository;

  late RepositorySearchBloc bloc;

  setUp(() {
    mockRepository = MockGithubRepository();

    bloc = RepositorySearchBloc(mockRepository);
  });

  final repositories = [
    RepositoryModel(
      name: 'flutter',

      description: 'Flutter framework',

      ownerName: 'flutter',

      ownerAvatarUrl: 'https://example.com/avatar.png',

      ownerProfileUrl: 'https://github.com/flutter',

      repositoryUrl: 'https://github.com/flutter/flutter',

      forksCount: 1000,

      createdAt: DateTime.now(),

      updatedAt: DateTime.now(),
    ),
  ];

  blocTest<RepositorySearchBloc, RepositorySearchState>(
    'emits [Loading, Loaded] when search succeeds',

    build: () {
      when(
        () => mockRepository.searchRepositories('flutter'),
      ).thenAnswer((_) async => repositories);

      return bloc;
    },

    act: (bloc) {
      bloc.add(SearchRepositoriesRequested('flutter'));
    },

    expect: () => [
      RepositorySearchLoading(),

      RepositorySearchLoaded(repositories),
    ],
  );

  blocTest<RepositorySearchBloc, RepositorySearchState>(
    'emits [Loading, Error] when search fails',

    build: () {
      when(
        () => mockRepository.searchRepositories('flutter'),
      ).thenThrow(Exception());

      return bloc;
    },

    act: (bloc) {
      bloc.add(SearchRepositoriesRequested('flutter'));
    },

    expect: () => [
      RepositorySearchLoading(),

      RepositorySearchError('Something went wrong.'),
    ],
  );
}
