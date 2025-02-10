import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';

class SourceTitleDetailState {
  SourceTitleDetailState({
    required this.titles,
    required this.currentPage,
    required this.totalPages,
    required this.totalResults,
    required this.hasReachedEnd,
    required this.sourceIds,
    this.isLoadingMore = false,
  });

  List<TitleSummary> titles;
  int currentPage;
  int totalPages;
  int totalResults;
  bool hasReachedEnd;
  String sourceIds;
  bool isLoadingMore;

  void updateState({
    List<TitleSummary>? titles,
    int? currentPage,
    int? totalPages,
    int? totalResults,
    bool? hasReachedEnd,
    String? sourceIds,
    bool? isLoadingMore,
  }) {
    if (titles != null) {
      this.titles = titles;
    }
    if (currentPage != null) {
      this.currentPage = currentPage;
    }
    if (totalPages != null) {
      this.totalPages = totalPages;
    }
    if (totalResults != null) {
      this.totalResults = totalResults;
    }
    if (hasReachedEnd != null) {
      this.hasReachedEnd = hasReachedEnd;
    }
    if (sourceIds != null) {
      this.sourceIds = sourceIds;
    }

    if (isLoadingMore != null) {
      this.isLoadingMore = isLoadingMore;
    }
  }
}
