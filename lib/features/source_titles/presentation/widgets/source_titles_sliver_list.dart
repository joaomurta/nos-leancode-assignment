import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/features/source_titles/presentation/widgets/source_titles_list_item.dart';
import 'package:assignment/features/source_titles/viewModel/source_titles_state.dart';
import 'package:flutter/material.dart';

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
          // Loading indicator at the end
          if (index == sourceTitlesState.titles.length) {
            if (sourceTitlesState.isLoadingMore) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: LoadingWidget(),
              );
            }
            return null;
          }
          return SourceTitlesListItem(
            sourceTitle: sourceTitlesState.titles[index],
            index: index,
            isSelected: selectedIndex == index,
            onTap: () => onItemTap(index),
          );
        },
        childCount: sourceTitlesState.titles.length +
            (sourceTitlesState.isLoadingMore ? 1 : 0),
      ),
    );
  }
}
