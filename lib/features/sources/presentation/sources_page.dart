import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/features/sources/presentation/widgets/sources_section.dart';
import 'package:assignment/features/sources/viewModel/sources_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';

import '../cubit/utils_sources_cubit.dart';

class SourcesPage extends Page<void> {
  const SourcesPage({
    super.key,
  });

  @override
  Route<void> createRoute(BuildContext context) => AppRoute(
        id: PageId.sourcesPage,
        settings: this,
        builder: (context) => BlocProvider(
          create: (context) => UtilsSourcesCubit(
            api: context.read(),
          )..run(),
          child: const _SourcesScreen(),
        ),
      );
}

class _SourcesScreen extends StatelessWidget {
  const _SourcesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const Text(
          'Sources',
          style: TextStyle(
            color: Color.fromRGBO(255, 172, 172, 0.895),
            fontWeight: FontWeight.w200,
            fontSize: 34,
          ),
        ),
      ),
      body: RequestCubitBuilder(
        cubit: context.read<UtilsSourcesCubit>(),
        builder: (context, state) => _SourcesDataView(sourcesState: state),
      ),
    );
  }
}

class _SourcesDataView extends StatelessWidget {
  const _SourcesDataView({required this.sourcesState});

  final SourcesState sourcesState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          SourcesSection(
            title: 'Subscription',
            sources: sourcesState.sourcesByType[SourceType.sub] ?? [],
          ),
          SourcesSection(
            title: 'Free',
            sources: sourcesState.sourcesByType[SourceType.free] ?? [],
          ),
          SourcesSection(
            title: 'Purchase',
            sources: sourcesState.sourcesByType[SourceType.purchase] ?? [],
          ),
          SourcesSection(
            title: 'TV Channels',
            sources: sourcesState.sourcesByType[SourceType.tve] ?? [],
          ),
        ],
      ),
    );
  }
}
