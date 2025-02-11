import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/features/sources/presentation/widgets/sources_section_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: const SourcesSectionList(),
    );
  }
}
