import 'package:assignment/api/chopper_request_cubit.dart';
import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/features/source_titles/viewModel/source_titles_state.dart';
import 'package:chopper/chopper.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';

class UtilsSourceTitlesCubit
    extends ChopperRequestCubit<TitlesResult, SourceTitlesState> {
  UtilsSourceTitlesCubit({
    required WatchmodeApi api,
  })  : _api = api,
        sourceTitlesState = SourceTitlesState(
          titles: [],
          currentPage: 0,
          totalPages: 0,
          totalResults: 0,
          hasReachedEnd: false,
          sourceIds: '',
        ),
        super('UtilsSourceTitlesCubit');

  final WatchmodeApi _api;
  final SourceTitlesState sourceTitlesState;
  static const int pageLimit = 20;

  @override
  Future<Response<TitlesResult>> request([String? sourceId]) =>
      _api.listTitlesGet(
        sourceIds: sourceId,
        limit: pageLimit,
        page: sourceTitlesState.currentPage,
      );

  @override
  SourceTitlesState map(TitlesResult data) {
    final newTitles = [...sourceTitlesState.titles, ...data.titles];

    return SourceTitlesState(
      titles: newTitles,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalResults: data.totalResults ?? 0,
      hasReachedEnd: data.page >= data.totalPages,
      sourceIds: sourceTitlesState.sourceIds,
    );
  }

  Future<void> loadTitles(String sourceIds) async {
    print('LoadTitles called with: $sourceIds');

    sourceTitlesState.updateState(sourceIds: sourceIds);

    emit(
      RequestSuccessState(sourceTitlesState),
    );

    final response = await request(sourceIds);
    if (response.isSuccessful && response.body != null) {
      final newsourceTitlesState = map(response.body!);
      sourceTitlesState.updateState(
        titles: newsourceTitlesState.titles,
        currentPage: newsourceTitlesState.currentPage,
        totalPages: newsourceTitlesState.totalPages,
        totalResults: newsourceTitlesState.totalResults,
        hasReachedEnd: false,
      );
      emit(RequestSuccessState(newsourceTitlesState));
    }
    print(
      'Request completed ${sourceTitlesState.sourceIds} ${sourceTitlesState.titles} ${sourceTitlesState.currentPage}${sourceTitlesState.totalPages}${sourceTitlesState.totalResults}${sourceTitlesState.hasReachedEnd}',
    );
  }
}

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
