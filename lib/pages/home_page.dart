import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/repository_search/repository_search_bloc.dart';
import '../blocs/repository_search/repository_search_event.dart';
import '../blocs/repository_search/repository_search_state.dart';
import '../repositories/github_repository.dart';
import '../services/github_api_service.dart';
import '../utils/constants.dart';
import '../widgets/empty_view.dart';
import '../widgets/repository_card.dart';
import '../widgets/search_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RepositorySearchBloc(GithubRepository(GithubApiService())),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Repository Search')),
      body: Padding(
        padding: const .all(Constants.defaultPadding),
        child: Column(
          children: [
            SearchInput(
              controller: _controller,
              onSearch: () {
                final query =
                _controller.text.trim();

                if (query.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        Constants.emptySearchMessage,
                      ),
                    ),
                  );

                  return;
                }

                context
                    .read<RepositorySearchBloc>()
                    .add(
                  SearchRepositoriesRequested(
                    query,
                  ),
                );
              },
            ),
            const SizedBox(height: Constants.defaultPadding),
            Expanded(
              child: BlocConsumer<
                  RepositorySearchBloc,
                  RepositorySearchState>(
                listener: (context, state) {
                  if (state is RepositorySearchError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RepositorySearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is RepositorySearchLoaded) {
                    return ListView.builder(
                      itemCount: state.repositories.length,
                      itemBuilder: (context, index) {
                        final repository = state.repositories[index];

                        return RepositoryCard(
                          repository: repository,
                        );
                      },
                    );
                  }

                  return const EmptyView(message: Constants.initialSearchMessage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
