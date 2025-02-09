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
    // Print all sources and their types
    print('All Sources Data:');
    for (var source in data) {
      print(
          'Source: ${source.name}, Type: ${source.type} (${source.type.runtimeType})');
    }

    final result = _organizeByType(data);

    // Print organized results
    print('\nOrganized Results:');
    result.forEach((key, value) {
      print('Type $key: ${value.length} sources');
    });

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
      print('Processing source: ${source.name} with type: ${source.type}');

      // Get the matching SourceType
      SourceType? matchingType;
      switch (source.type.value) {
        case 'sub':
          matchingType = SourceType.sub;
          break;
        case 'free':
          matchingType = SourceType.free;
          break;
        case 'purchase':
          matchingType = SourceType.purchase;
          break;
        case 'tve':
          matchingType = SourceType.tve;
          break;
      }

      if (matchingType != null) {
        organized.putIfAbsent(matchingType, () => []);
        organized[matchingType]!.add(source);
      }
    }

    return organized;
  }
}
