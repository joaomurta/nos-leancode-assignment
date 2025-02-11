import 'package:assignment/common/extensions/source_type_title_extension.dart';
import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
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
        onLoading: (context) => const LoadingWidget(),
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
      child: ListView.builder(
        itemCount: sourcesState.sourcesByType.length,
        itemBuilder: (context, index) {
          final type = sourcesState.sourcesByType.keys.elementAt(index);
          final sources = sourcesState.sourcesByType[type] ?? [];
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SourcesSection(
              title: type.nameDescription,
              sources: sources,
            ),
          );
        },
      ),
    );
  }
}
