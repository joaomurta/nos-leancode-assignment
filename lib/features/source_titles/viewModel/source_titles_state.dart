import 'package:assignment/api/gen/watchmode_api.swagger.dart';

class SourceTitlesState {
  SourceTitlesState({
    required this.titles,
    required this.currentPage,
    required this.totalPages,
    required this.totalResults,
    required this.hasReachedEnd,
    required this.sourceIds,
    this.isLoadingMore = false, // Add this
  });

  List<TitleSummary> titles;
  int currentPage;
  int totalPages;
  int totalResults;
  bool hasReachedEnd;
  String sourceIds;
  bool isLoadingMore; // Add this

  void updateState({
    List<TitleSummary>? titles,
    int? currentPage,
    int? totalPages,
    int? totalResults,
    bool? hasReachedEnd,
    String? sourceIds,
    bool? isLoadingMore, // Add this
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

// Extension for type formatting
extension TitleTypeExtension on TitleType {
  String get name {
    switch (this) {
      case TitleType.movie:
        return 'Movie';
      case TitleType.shortFilm:
        return 'Short Movie';
      case TitleType.tvMiniseries:
        return 'TV Mini Series';
      case TitleType.tvSeries:
        return 'TV Series';
      case TitleType.tvSpecial:
        return 'TV Special';
      case TitleType.swaggerGeneratedUnknown:
        return 'Unknown';
    }
  }
}
