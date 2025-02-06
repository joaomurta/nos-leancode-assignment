import 'package:assignment/core/navigation/routes.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/home.dart';
import '../../features/source_titles/presentation/source_titles.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.sourceTitles,
      builder: (context, state) => const SourceTitles(),
    ),
  ],
);
