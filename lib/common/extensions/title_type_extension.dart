import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';

extension TitleTypeExtension on TitleType {
  String get nameDescription {
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
