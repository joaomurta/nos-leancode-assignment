import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';

class SourceTitleDetailState {
  SourceTitleDetailState({
    required this.poster,
    required this.title,
    required this.type,
    required this.year,
    required this.genreNames,
    required this.overview,
    this.userRating,
    this.relevance,
  });

  String poster;
  String title;
  TitleType type;
  int year;
  List<String> genreNames;
  String overview;
  double? userRating;
  double? relevance;
}
