/* import 'package:assignment/api/gen/client_index.dart';
 */
import 'package:assignment/api/watchmode_api.dart';
import 'package:assignment/common/config/app_global_keys.dart';
import 'package:assignment/common/config/lean_analytics.dart';
import 'package:assignment/common/hooks/use_global_key.dart';
import 'package:assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:leancode_analytics/core/analytics.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';

class GlobalProviders extends HookWidget {
  const GlobalProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final navigatorKey = useGlobalKey<NavigatorState>();
    final globalKeys = useMemoized(
      () => AppGlobalKeys(navigatorKey: navigatorKey),
    );

    final leanAnalytics = useMemoized(NoopLeanAnalytics.new);
    final api = createWatchmodeApi(
      baseUrl: config.watchmodeBaseUrl,
      apiKey: config.watchmodeApiKey,
    );

    return MultiProvider(
      providers: [
        Provider.value(value: globalKeys),
        Provider<LeanAnalytics>.value(value: leanAnalytics),
        Provider.value(value: api),
      ],
      child: child,
    );
  }
}
