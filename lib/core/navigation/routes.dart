import 'dart:convert';

import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/features/source_title_detail/presentation/source_title_page.dart';
import 'package:assignment/features/source_titles/presentation/source_titles_page.dart';
import 'package:assignment/features/sources/presentation/sources_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

class SourcesRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const SourcesPage();
}

class SourceTitlesRoute extends GoRouteData {
  SourceTitlesRoute({
    required this.$source,
  });

  final String $source;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final sourceSummary = SourceSummary.fromJson(
      json.decode($source) as Map<String, dynamic>,
    );
    return SourceTitlesPage(source: sourceSummary);
  }
}

class SourceTitleDetailRoute extends GoRouteData {
  SourceTitleDetailRoute({
    required this.titleId,
  });

  final String titleId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      SourceTitleDetailPage(titleId: titleId);
}

@TypedShellRoute<RootRoute>(
  routes: [
    TypedGoRoute<SourcesRoute>(path: '/'),
    TypedGoRoute<SourceTitlesRoute>(path: '/source-titles'),
    TypedGoRoute<SourceTitleDetailRoute>(path: '/title-detail'),
  ],
)
class RootRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return navigator;
  }
}
