import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/common/keys/page_ids.dart';
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
      body: RequestCubitBuilder(
        cubit: context.read<UtilsSourceTitlesCubit>(),
        builder: (context, state) => _SourceTitlesDataView(
          source: source,
          sourceTitlesState: state,
        ),
      ),
    );
  }
}

class _SourceTitlesDataView extends StatefulWidget {
  const _SourceTitlesDataView({
    required this.sourceTitlesState,
    required this.source,
  });

  final SourceTitlesState sourceTitlesState;
  final SourceSummary source;

  @override
  _SourceTitlesDataViewState createState() => _SourceTitlesDataViewState();
}

class _SourceTitlesDataViewState extends State<_SourceTitlesDataView> {
  final ScrollController _scrollController = ScrollController();
  bool _canLoadMore = true;
  int? _itemSelected;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    // Check if can load more and are near the bottom
    if (!_canLoadMore) {
      return;
    }

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final threshold = maxScroll * 0.9; // Load when 90% scrolled

    if (currentScroll >= threshold) {
      _loadMore();
    }
  }

  void _loadMore() {
    if (!widget.sourceTitlesState.isLoadingMore &&
        !widget.sourceTitlesState.hasReachedEnd) {
      _canLoadMore = false;
      context.read<UtilsSourceTitlesCubit>().loadMoreTitles();
      // Reset canLoadMore after a delay to prevent multiple triggers
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _canLoadMore = true;
          });
        }
      });
    }
  }

  @override
  void didUpdateWidget(_SourceTitlesDataView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset loading flag if new data was loaded
    if (widget.sourceTitlesState.titles.length >
        oldWidget.sourceTitlesState.titles.length) {
      _canLoadMore = true;
    }
  }

  void _handleItemTap(int index) {
    setState(() {
      _itemSelected = index;
    });

    final titleId = widget.sourceTitlesState.titles[index].id.toString();
    context.push(
      SourceTitleDetailRoute(titleId: titleId).location,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SourceTitlesSliverAppBar(source: widget.source),
        SourceTitlesSliverList(
          sourceTitlesState: widget.sourceTitlesState,
          selectedIndex: _itemSelected,
          onItemTap: _handleItemTap,
        ),
      ],
    );
  }
}
