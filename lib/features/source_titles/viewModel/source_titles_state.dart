import 'package:assignment/api/gen/watchmode_api.swagger.dart';

class SourceTitlesState {
  SourceTitlesState({
    required this.sourceIds,
    required this.titles,
    required this.currentPage,
    required this.totalPages,
    required this.totalResults,
    required this.hasReachedEnd,
  });

  List<TitleSummary> titles;
  String sourceIds;
  int currentPage;
  int totalPages;
  int totalResults;
  bool hasReachedEnd;
}
