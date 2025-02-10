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
  bool _isLoading = false;

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
    try {
      final response = await _api.listTitlesGet(
        sourceIds: sourceIds,
        limit: pageLimit,
        page: 0,
      );

      if (response.isSuccessful && response.body != null) {
        sourceTitlesState.updateState(
          titles: response.body!.titles,
          currentPage: response.body!.page,
          totalPages: response.body!.totalPages,
          totalResults: response.body!.totalResults ?? 0,
          hasReachedEnd: response.body!.page >= response.body!.totalPages,
          sourceIds: sourceIds,
        );

        emit(RequestSuccessState(sourceTitlesState));
      } else {
        // Handle empty or error response
        sourceTitlesState.updateState(
          titles: [],
          currentPage: 0,
          totalPages: 0,
          totalResults: 0,
          hasReachedEnd: true,
          sourceIds: sourceIds,
        );

        emit(RequestSuccessState(sourceTitlesState));
      }
    } catch (e) {
      print('Error loading titles: $e');

      // Handle error state
      sourceTitlesState.updateState(
        titles: [],
        currentPage: 0,
        totalPages: 0,
        totalResults: 0,
        hasReachedEnd: true,
        sourceIds: sourceIds,
      );

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
      // Important: Emit the loading state
      emit(RequestSuccessState(sourceTitlesState));

      final nextPage = sourceTitlesState.currentPage + 1;
      final response = await _api.listTitlesGet(
        sourceIds: sourceTitlesState.sourceIds,
        limit: pageLimit,
        page: nextPage,
      );

      if (response.isSuccessful && response.body != null) {
        final newTitles = [
          ...sourceTitlesState.titles,
          ...response.body!.titles,
        ];

        sourceTitlesState.updateState(
          titles: newTitles,
          currentPage: nextPage,
          totalPages: response.body!.totalPages,
          totalResults:
              response.body!.totalResults ?? sourceTitlesState.totalResults,
          hasReachedEnd: nextPage >= response.body!.totalPages,
          isLoadingMore: false,
        );

        // Important: Emit success state with updated data
        emit(RequestSuccessState(sourceTitlesState));
      } else {
        sourceTitlesState.updateState(
          hasReachedEnd: true,
          isLoadingMore: false,
        );
        emit(RequestErrorState());
      }
    } catch (e) {
      print('Error loading more titles: $e');
      sourceTitlesState.updateState(
        hasReachedEnd: true,
        isLoadingMore: false,
      );
      emit(RequestErrorState());
    }
  }
}
