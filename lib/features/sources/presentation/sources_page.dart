import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/core/navigation/routes.dart';
import 'package:assignment/features/sources/viewModel/sources_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

class SourceCard extends StatelessWidget {
  const SourceCard({super.key, required this.source});

  final SourceSummary source;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(SourceTitlesRoute().location),
      child: Container(
        width: 165,
        decoration: BoxDecoration(
          color: const Color.fromARGB(124, 54, 33, 25),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromRGBO(82, 49, 36, 1),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            children: [
              Image.network(
                source.logo100px,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              Text(
                source.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SourcesListView extends StatelessWidget {
  const SourcesListView({super.key, required this.sources});

  final List<SourceSummary> sources;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 165,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        itemBuilder: (context, index) {
          final source = sources[index];
          return Padding(
            padding: const EdgeInsets.only(
              right: 16, // Adds space between items
              // If you want the last item to have padding too:
              // right: index == sources.length - 1 ? 20 : 16,
            ),
            child: SourceCard(source: source),
          );
        },
      ),
    );
  }
}

/* class SourcesListView extends StatelessWidget {
  const SourcesListView({super.key, required this.sources});

  final List<SourceSummary> sources;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            spacing: 8,
            children: [
              InkWell(
                onTap: () => context.push('AppRoutes.sourceTitles'),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(124, 54, 33, 25),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromRGBO(82, 49, 36, 1),
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Image.network(
                          'https://www.motoxpert.pt/sh_website_category_page/static/src/img/default.png',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          sourcesState
                                  .sourcesByType[SourceType.free]?[0]?.name ??
                              '',
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 172, 172, 0.895),
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} */

class SourcesSection extends StatelessWidget {
  const SourcesSection({super.key, required this.title, required this.sources});

  final String title;
  final List<SourceSummary> sources;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: const TextStyle(
              color: Color.fromRGBO(255, 172, 172, 0.895),
              fontWeight: FontWeight.w300,
              fontSize: 24,
            ),
          ),
        ),
        SourcesListView(sources: sources),
      ],
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
