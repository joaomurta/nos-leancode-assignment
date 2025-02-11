import 'package:assignment/common/extensions/source_type_title_extension.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/features/sources/cubit/utils_sources_cubit.dart';
import 'package:assignment/features/sources/presentation/widgets/sources_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';

class SourcesSectionList extends StatelessWidget {
  const SourcesSectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return RequestCubitBuilder(
      cubit: context.read<UtilsSourcesCubit>(),
      builder: (context, sourcesState) => Center(
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
      ),
      onLoading: (context) => const LoadingWidget(),
    );
  }
}
