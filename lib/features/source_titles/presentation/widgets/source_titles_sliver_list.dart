import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/features/source_titles/cubit/utils_source_titles_cubit.dart';
import 'package:assignment/features/source_titles/presentation/widgets/source_titles_list_item.dart';
import 'package:assignment/features/source_titles/viewModel/source_titles_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourceTitlesSliverList extends StatelessWidget {
  const SourceTitlesSliverList({
    super.key,
    required this.sourceTitlesState,
    required this.selectedIndex,
    required this.onItemTap,
  });

  final SourceTitlesState sourceTitlesState;
  final int? selectedIndex;
  final void Function(int index) onItemTap;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // Always show loading cell at the end if not reached end
          if (index == sourceTitlesState.titles.length - 1 &&
              !sourceTitlesState.hasReachedEnd) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Trigger load more when reaching the loading cell
              context.read<UtilsSourceTitlesCubit>().loadMoreTitles();
            });

            return const Padding(
              padding: EdgeInsets.all(16),
              child: LoadingWidget(),
            );
          }

          // Return null if we've gone past our items
          if (index >= sourceTitlesState.titles.length) {
            return null;
          }

          return SourceTitlesListItem(
            sourceTitle: sourceTitlesState.titles[index],
            index: index,
            isSelected: selectedIndex == index,
            onTap: () => onItemTap(index),
          );
        },
        childCount: sourceTitlesState.titles.length,
      ),
    );
  }
}
