import 'package:go_router/go_router.dart';
import '../models/repository_model.dart';
import '../pages/repository_details_page.dart';

import '../pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/repository/:name',

      builder: (context, state) {
        final repository = state.extra as RepositoryModel;

        return RepositoryDetailsPage(repository: repository);
      },
    ),
  ],
);
