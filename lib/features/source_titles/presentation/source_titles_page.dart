import 'dart:ui';

import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/common/extensions/title_type_extension.dart';
import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/core/navigation/routes.dart';
import 'package:assignment/features/source_titles/cubit/utils_source_titles_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 130,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black.withAlpha(128),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
                title: Expanded(
                  child: Row(
                    spacing: 8,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 14,
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                        ),
                      ),
                      Image.network(
                        widget.source.logo100px,
                        width: 65,
                        height: 65,
                        fit: BoxFit.scaleDown,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const LoadingWidget();
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: double.infinity,
                          child: const Icon(Icons.error),
                        ),
                      ),
                      Text(
                        widget.source.name,
                        style: const TextStyle(
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                          fontWeight: FontWeight.w200,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              // Loading indicator at the end
              if (index == widget.sourceTitlesState.titles.length) {
                if (widget.sourceTitlesState.isLoadingMore) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: LoadingWidget(),
                  );
                }
                return null;
              }
              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _itemSelected = index;
                    });

                    final titleId =
                        widget.sourceTitlesState.titles[index].id.toString();
                    context.push(
                      SourceTitleDetailRoute(titleId: titleId).location,
                    );
                  },
                  child: Container(
                    height: 85,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _itemSelected == index
                          ? const Color.fromARGB(122, 132, 93, 78)
                          : const Color.fromARGB(124, 54, 33, 25),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromRGBO(82, 49, 36, 1),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.sourceTitlesState.titles[index].title,
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 172, 172, 0.895),
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              height: 0.95,
                            ),
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                    255,
                                    172,
                                    172,
                                    0.895,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  widget.sourceTitlesState.titles[index].type
                                      .name,
                                  style: const TextStyle(
                                    color: Color.fromARGB(124, 54, 33, 25),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Text(
                                widget.sourceTitlesState.titles[index].year
                                    .toString(),
                                style: const TextStyle(
                                  color: Color.fromRGBO(255, 172, 172, 0.895),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: widget.sourceTitlesState.titles.length +
                (widget.sourceTitlesState.isLoadingMore ? 1 : 0),
          ),
        ),
      ],
    );
  }
}
