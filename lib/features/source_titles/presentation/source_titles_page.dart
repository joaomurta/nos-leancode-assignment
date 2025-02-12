import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/core/navigation/routes.dart';
import 'package:assignment/features/source_titles/cubit/utils_source_titles_cubit.dart';
import 'package:assignment/features/source_titles/presentation/widgets/source_titles_sliver_app_bar.dart';
import 'package:assignment/features/source_titles/presentation/widgets/source_titles_sliver_list.dart';
import 'package:assignment/features/source_titles/viewModel/source_titles_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';

class SourceTitlesPage extends Page<void> {
  const SourceTitlesPage({
    super.key,
    required this.source,
  });

  final SourceSummary source;

  @override
  Route<void> createRoute(BuildContext context) => AppRoute(
        id: PageId.sourceTitlesPage,
        settings: this,
        builder: (context) => BlocProvider(
          create: (context) => UtilsSourceTitlesCubit(
            api: context.read(),
          )..loadTitles(source.id.toString()),
          child: _SourceTitlesScreen(
            source: source,
          ),
        ),
      );
}

class _SourceTitlesScreen extends StatelessWidget {
  const _SourceTitlesScreen({required this.source});

  final SourceSummary source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SourceTitlesList(source: source),
    );
  }
}

class SourceTitlesList extends StatefulWidget {
  const SourceTitlesList({
    super.key,
    required this.source,
  });

  final SourceSummary source;

  @override
  _SourceTitlesListState createState() => _SourceTitlesListState();
}

class _SourceTitlesListState extends State<SourceTitlesList> {
  int? _itemSelected;

  void _handleItemTap(int index, SourceTitlesState sourceTitlesState) {
    setState(() {
      _itemSelected = index;
    });

    final titleId = sourceTitlesState.titles[index].id.toString();
    context.push(
      SourceTitleDetailRoute(titleId: titleId).location,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SourceTitlesSliverAppBar(source: widget.source),
        RequestCubitBuilder(
          cubit: context.read<UtilsSourceTitlesCubit>(),
          builder: (context, sourceTitlesState) {
            return SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SourceTitlesSliverList(
                sourceTitlesState: sourceTitlesState,
                selectedIndex: _itemSelected,
                onItemTap: (index) => _handleItemTap(index, sourceTitlesState),
              ),
            );
          },
          onInitial: (context) => const SliverFillRemaining(
            child: LoadingWidget(),
          ),
        ),
      ],
    );
  }
}
