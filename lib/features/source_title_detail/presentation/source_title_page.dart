import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/features/source_title_detail/cubit/utils_source_title_detail.dart';
import 'package:assignment/features/source_title_detail/presentation/widgets/source_title_detail_categorys_info.dart';
import 'package:assignment/features/source_title_detail/presentation/widgets/source_title_detail_header.dart';
import 'package:assignment/features/source_title_detail/presentation/widgets/source_title_detail_more_info.dart';
import 'package:assignment/features/source_title_detail/viewModel/source_title_detail_state.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: false,
        title: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Color.fromRGBO(255, 172, 172, 0.895),
          ),
        ),
      ),
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
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          SourceTitleDetailHeader(
            detail: detail,
          ),
          SourceTitleDetailCategorysInfo(
            detail: detail,
          ),
          SourceTitleDetailMoreInfo(
            detail: detail,
          ),
        ],
      ),
    );
  }
}
