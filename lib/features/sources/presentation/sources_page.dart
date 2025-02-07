import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/core/navigation/router.dart';
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
      appBar: AppBar(
        title: const Text('Sources'),
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
    final Widget horizontalList1 = Container(
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
                          sourcesState.allSources[0].name,
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
              Container(
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
                      const Text(
                        'sources[1].name',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
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
                      const Text(
                        'Source Name',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
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
                      const Text(
                        'Source Name',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
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
                      const Text(
                        'Source Name',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

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
      body: Center(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 1',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 2',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 3',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 4',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 5',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 6',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
          ],
        ),
      ),
    );
  }
}
