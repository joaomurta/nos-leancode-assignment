import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/features/source_titles/cubit/utils_source_titles_cubit.dart';
import 'package:assignment/features/source_titles/presentation/widgets/source_titles_list_item.dart';
import 'package:assignment/features/source_titles/viewModel/source_titles_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourceTitlesSliverList extends StatelessWidget {
  // MARK: something to do
  const SourceTitlesSliverList({
    super.key,
    required this.sourceTitlesState,
    required this.selectedIndex,
    required this.onItemTap,
  });

  final SourceTitlesState sourceTitlesState;
  final int? selectedIndex;
  final void Function(int index) onItemTap;

// MARK: something to do
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // First show all items
          if (index < sourceTitlesState.titles.length) {
            return SourceTitlesListItem(
              sourceTitle: sourceTitlesState.titles[index],
              index: index,
              isSelected: selectedIndex == index,
              onTap: () => onItemTap(index),
            );
          }

          // Then show loading indicator as an extra item if not reached end
          if (!sourceTitlesState.hasReachedEnd) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<UtilsSourceTitlesCubit>().loadMoreTitles();
            });

            return const Padding(
              padding: EdgeInsets.all(16),
              child: LoadingWidget(),
            );
          }

          return null;
        },
        childCount: sourceTitlesState.titles.length +
            (sourceTitlesState.hasReachedEnd ? 0 : 1),
      ),
    );
  }
}
