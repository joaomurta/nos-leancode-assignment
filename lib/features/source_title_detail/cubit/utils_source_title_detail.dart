import 'package:assignment/api/chopper_request_cubit.dart';
import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/features/source_title_detail/viewModel/source_title_detail_state.dart';
import 'package:chopper/chopper.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';

class UtilsSourceTitleDetailCubit
    extends ChopperRequestCubit<TitleDetails, SourceTitleDetailState> {
  UtilsSourceTitleDetailCubit({
    required WatchmodeApi api,
  })  : _api = api,
        titleDetailState = SourceTitleDetailState(
          poster: '',
          title: '',
          type: TitleType.movie,
          year: 0,
          genreNames: [],
          overview: '',
          userRating: 0,
          relevance: 0,
        ),
        super('UtilsSourceTitleDetailCubit');

  final WatchmodeApi _api;
  final SourceTitleDetailState titleDetailState;

  @override
  Future<Response<TitleDetails>> request([int? titleId]) =>
      _api.titleTitleIdDetailsGet(titleId: titleId);

  @override
  SourceTitleDetailState map(TitleDetails data) {
    final result = data;

    return SourceTitleDetailState(
      poster: result.poster,
      title: result.title,
      type: result.type,
      year: result.year,
      genreNames: result.genreNames,
      overview: result.plotOverview,
      userRating: result.userRating,
      relevance: result.relevancePercentile,
    );
  }

  Future<void> loadTitle(int titleId) async {
    try {
      final response = await request(titleId);

      if (response.isSuccessful && response.body != null) {
        emit(RequestSuccessState(map(response.body!)));
      } else {
        emit(RequestErrorState());
      }
    } catch (e) {
      emit(RequestErrorState());
    }
  }
}
