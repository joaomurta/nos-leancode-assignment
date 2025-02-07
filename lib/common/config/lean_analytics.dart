import 'package:leancode_analytics/leancode_analytics.dart';

class NoopLeanAnalytics implements LeanAnalytics {
  @override
  void register(AnalyticsEvent event) {
    // noop
  }
}
