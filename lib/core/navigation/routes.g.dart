// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootRoute,
    ];

RouteBase get $rootRoute => ShellRouteData.$route(
      factory: $RootRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $SourcesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/source-titles',
          factory: $SourceTitlesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/title-detail',
          factory: $SourceTitleDetailRouteExtension._fromState,
        ),
      ],
    );

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => RootRoute();
}

extension $SourcesRouteExtension on SourcesRoute {
  static SourcesRoute _fromState(GoRouterState state) => SourcesRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SourceTitlesRouteExtension on SourceTitlesRoute {
  static SourceTitlesRoute _fromState(GoRouterState state) => SourceTitlesRoute(
        $source: state.uri.queryParameters[r'$source']!,
      );

  String get location => GoRouteData.$location(
        '/source-titles',
        queryParams: {
          r'$source': $source,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SourceTitleDetailRouteExtension on SourceTitleDetailRoute {
  static SourceTitleDetailRoute _fromState(GoRouterState state) =>
      SourceTitleDetailRoute(
        titleId: state.uri.queryParameters['title-id']!,
      );

  String get location => GoRouteData.$location(
        '/title-detail',
        queryParams: {
          'title-id': titleId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
