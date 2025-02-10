import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/features/source_title_detail/cubit/utils_source_title_detail.dart';
import 'package:assignment/features/source_title_detail/viewModel/source_title_detail_state.dart';
import 'package:assignment/features/source_titles/cubit/utils_source_titles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';

class SourceTitleDetailPage extends Page<void> {
  const SourceTitleDetailPage({
    super.key,
    required this.titleId,
  });

  final String titleId;

  @override
  Route<void> createRoute(BuildContext context) => AppRoute(
        id: PageId.sourceTitleDetailPage,
        settings: this,
        builder: (context) => BlocProvider(
          create: (context) => UtilsSourceTitleDetailCubit(
            api: context.read(),
          )..loadTitle(int.tryParse(titleId) ?? 0),
          child: _SourceTitleDetailScreen(
            titleId: int.tryParse(titleId) ?? 0,
          ),
        ),
      );
}

class _SourceTitleDetailScreen extends StatelessWidget {
  const _SourceTitleDetailScreen({required this.titleId});

  final int titleId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RequestCubitBuilder(
        cubit: context.read<UtilsSourceTitleDetailCubit>(),
        builder: (context, state) => _SourceTitleDetailDataView(
          detail: state,
        ),
        onLoading: (context) => const LoadingWidget(),
      ),
    );
  }
}

class _SourceTitleDetailDataView extends StatelessWidget {
  const _SourceTitleDetailDataView({required this.detail});

  final SourceTitleDetailState detail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        detail.title,
        style: const TextStyle(color: Colors.white, fontSize: 35),
      ),
    );
  }
}
