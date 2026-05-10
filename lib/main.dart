import 'package:flutter/material.dart';
import 'package:flutter_github_repository_search/utils/constants.dart';
import 'package:go_router/go_router.dart';
import 'theme/app_theme.dart';
import 'router/app_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
