import 'package:assignment/app_config.dart';
import 'package:assignment/common/widgets/global_providers.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_analytics/leancode_analytics.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';
import 'package:leancode_hooks/leancode_hooks.dart';

final config = AppConfig(
  watchmodeBaseUrl: Uri.parse('https://api.watchmode.com/v1'),
  watchmodeApiKey: 'ERgOn8wYL0z7iwKOn73BtVD8h1VH2lLZp0ztnlj0',
);

void main() {
  runApp(
    const GlobalProviders(
      child: MainApp(),
    ),
  );
}

class MainApp extends HookWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = useGoRouter(
      globalKeys: context.read(),
      initialLocation: SourcesRoute().location,
      observers: [
        LeanAnalyticsNavigationObserver(context.read()),
      ],
    );

    return RequestLayoutConfigProvider(
      requestMode: RequestMode.replace,
      onEmpty: (context) => const LoadingWidget(),
      onLoading: (context) => const LoadingWidget(),
      onError: (context, error, onErrorCallback) =>
          const Text('Error occurred'),
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
