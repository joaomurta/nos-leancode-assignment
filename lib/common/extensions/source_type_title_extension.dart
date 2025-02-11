import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';

extension SourceTypeTitleExtension on SourceType {
  String get nameDescription {
    switch (this) {
      case SourceType.sub:
        return 'Subscription';
      case SourceType.free:
        return 'Free';
      case SourceType.purchase:
        return 'Purchase';
      case SourceType.tve:
        return 'TV Channels';
      case SourceType.swaggerGeneratedUnknown:
        return 'Others';
    }
  }
}
