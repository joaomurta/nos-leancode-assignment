import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';
import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';

// State class for managing categorized
class SourcesState {
  SourcesState({
    required this.allSources,
    required this.sourcesByType,
  });

  final List<SourceSummary> allSources;
  Map<SourceType, List<SourceSummary>> sourcesByType;
}
