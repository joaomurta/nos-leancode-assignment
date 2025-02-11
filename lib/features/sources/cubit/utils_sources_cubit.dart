import 'package:assignment/api/chopper_request_cubit.dart';
import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/features/sources/viewModel/sources_state.dart';
import 'package:chopper/chopper.dart';

class UtilsSourcesCubit
    extends ChopperRequestCubit<List<SourceSummary>, SourcesState> {
  UtilsSourcesCubit({required WatchmodeApi api})
      : _api = api,
        sourcesState = SourcesState(
          allSources: [],
          sourcesByType: {},
        ),
        super(
          'UtilsSourceCubit',
        );

  final WatchmodeApi _api;
  final SourcesState sourcesState;

  @override
  Future<Response<List<SourceSummary>>> request() => _api.sourcesGet();

  @override
  SourcesState map(List<SourceSummary> data) {
    final result = getSourcesByType(data);

    return SourcesState(
      allSources: data,
      sourcesByType: result,
    );
  }

  Map<SourceType, List<SourceSummary>> getSourcesByType(
    List<SourceSummary> sources,
  ) {
    // get types
    final uniqueTypes = sources.map((source) => source.type).toSet();

    // Create a map to store sources by type
    final sourcesByType = <SourceType, List<SourceSummary>>{};

    // lists init for each type
    for (final type in uniqueTypes) {
      sourcesByType[type] =
          sources.where((source) => source.type == type).toList();
    }
    return sourcesByType;
  }
}
