import 'package:assignment/api/chopper_request_cubit.dart';
import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/features/sources/viewModel/sources_state.dart';
import 'package:chopper/chopper.dart';

class UtilsSourcesCubit
    extends ChopperRequestCubit<List<SourceSummary>, SourcesState> {
  UtilsSourcesCubit({required WatchmodeApi api})
      : _api = api,
        super(
          'UtilsSourceCubit',
          sourcesState: SourcesState(
            allSources: [],
            sourcesByType: {},
          ),
        );

  final WatchmodeApi _api;

  @override
  Future<Response<List<SourceSummary>>> request() => _api.sourcesGet();

  @override
  SourcesState map(List<SourceSummary> data) {
    print(_organizeByType(data));
    return SourcesState(
      allSources: data,
      sourcesByType: _organizeByType(data),
    );
  }

  // Helper method to organize sources by type
  Map<SourceType, List<SourceSummary>> _organizeByType(
    List<SourceSummary> sources,
  ) {
    final organized = <SourceType, List<SourceSummary>>{};

    for (final type in SourceType.values) {
      organized[type] = sources.where((source) => source.type == type).toList();
    }

    return organized;
  }
}
