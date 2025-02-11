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
  SourceTitlesState sourceTitlesState;
  static const int pageLimit = 20;

  @override
  Future<Response<TitlesResult>> request([String? sourceId, int? page]) =>
      _api.listTitlesGet(
        sourceIds: sourceId,
        limit: pageLimit,
        page: page,
      );

  @override
  SourceTitlesState map(TitlesResult data) {
    final newTitles = [...sourceTitlesState.titles, ...data.titles];

    sourceTitlesState = SourceTitlesState(
      titles: newTitles,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalResults: data.totalResults ?? 0,
      hasReachedEnd: data.page >= data.totalPages,
      sourceIds: sourceTitlesState.sourceIds,
      isLoadingMore: sourceTitlesState.isLoadingMore,
    );

    return sourceTitlesState;
  }

  Future<void> loadTitles(String sourceIds) async {
    try {
      emit(RequestInitialState());
      final response = await request(sourceIds);

      if (response.isSuccessful && response.body != null) {
        emit(RequestSuccessState(map(response.body!)));
      }
    } catch (e) {
      // Handle error state
      emit(RequestErrorState());
    }
  }

  Future<void> loadMoreTitles() async {
    // Prevent loading if already loading or reached end
    if (sourceTitlesState.isLoadingMore || sourceTitlesState.hasReachedEnd) {
      return;
    }

    try {
      sourceTitlesState.updateState(isLoadingMore: true);
      // Emit the loading state
      emit(RequestSuccessState(sourceTitlesState));

      final nextPage = sourceTitlesState.currentPage + 1;
      final response = await request(sourceTitlesState.sourceIds, nextPage);

      if (response.isSuccessful && response.body != null) {
        sourceTitlesState.updateState(
          isLoadingMore: false,
        );

        // Emit success state with updated data
        emit(RequestSuccessState(map(response.body!)));
      }
    } catch (e) {
      sourceTitlesState.updateState(
        hasReachedEnd: true,
        isLoadingMore: false,
      );
      emit(RequestErrorState());
    }
  }
}
