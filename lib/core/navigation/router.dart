import 'package:assignment/common/config/app_global_keys.dart';
import 'package:assignment/common/keys/page_ids.dart';
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_analytics/leancode_analytics.dart';
import 'package:leancode_hooks/leancode_hooks.dart';

import 'routes.dart';

GoRouter useGoRouter({
  required AppGlobalKeys globalKeys,
  required List<NavigatorObserver> observers,
  required String initialLocation,
}) {
  return useMemoized(
    () => GoRouter(
      navigatorKey: globalKeys.navigatorKey,
      initialLocation: initialLocation,
      routes: $appRoutes,
      observers: observers,
    ),
    [],
  );
}

class AppRoute extends MaterialPageRoute<void> implements LeanAnalyticsRoute {
  AppRoute({
    required PageId id,
    this.analyticsParams,
    required super.builder,
    required super.settings,
  }) : id = id.name;

  @override
  final String id;

  @override
  final Map<String, dynamic>? analyticsParams;
}
