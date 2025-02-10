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
    final result = _organizeByType(data);

    return SourcesState(
      allSources: data,
      sourcesByType: result,
    );
  }

  Map<SourceType, List<SourceSummary>> _organizeByType(
    List<SourceSummary> sources,
  ) {
    final organized = <SourceType, List<SourceSummary>>{};

    // Try a different comparison approach
    for (final source in sources) {
      // Get the matching SourceType
      SourceType? matchingType;
      switch (source.type.value) {
        case 'sub':
          matchingType = SourceType.sub;
        case 'free':
          matchingType = SourceType.free;
        case 'purchase':
          matchingType = SourceType.purchase;
        case 'tve':
          matchingType = SourceType.tve;
      }

      if (matchingType != null) {
        organized.putIfAbsent(matchingType, () => []);
        organized[matchingType]!.add(source);
      }
    }

    return organized;
  }
}
