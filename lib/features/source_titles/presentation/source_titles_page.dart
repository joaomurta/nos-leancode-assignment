import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/features/source_titles/cubit/utils_source_titles_cubit.dart';
import 'package:assignment/features/source_titles/viewModel/source_titles_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        onLoading: (context) => const LoadingWidget(),
      ),
    );
  }
}

class _SourceTitlesDataView extends StatelessWidget {
  const _SourceTitlesDataView({
    required this.sourceTitlesState,
    required this.source,
  });

  final SourceTitlesState sourceTitlesState;
  final SourceSummary source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 200,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                      source.logo100px,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      source.name,
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= sourceTitlesState.titles.length) {
                  return null; // This tells the builder to stop
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    height: 85,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(124, 54, 33, 25),
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
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              sourceTitlesState.titles[index].title,
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 172, 172, 0.895),
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 6,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                    255,
                                    172,
                                    172,
                                    0.895,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ), // Large value for pill shape
                                ),
                                child: Text(
                                  sourceTitlesState.titles[index].type.name,
                                  style: const TextStyle(
                                    color: Color.fromARGB(124, 54, 33, 25),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Text(
                                sourceTitlesState.titles[index].year.toString(),
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
                );
              },
              childCount: sourceTitlesState.titles.length,
            ),
          ),
        ],
      ),
    );
  }
}
