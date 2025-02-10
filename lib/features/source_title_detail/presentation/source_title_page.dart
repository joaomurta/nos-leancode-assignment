import 'package:assignment/common/extensions/title_type_extension.dart';
import 'package:assignment/common/keys/page_ids.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/core/navigation/router.dart';
import 'package:assignment/features/source_title_detail/cubit/utils_source_title_detail.dart';
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
          Image.network(
            alignment: Alignment.centerLeft,
            detail.poster,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.6,
            fit: BoxFit.contain,
          ),
          Text(
            detail.title,
            style: const TextStyle(
              color: Color.fromRGBO(255, 172, 172, 0.895),
              fontSize: 35,
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            spacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                    255,
                    172,
                    172,
                    0.895,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  detail.type.name,
                  style: const TextStyle(
                    color: Color.fromARGB(124, 54, 33, 25),
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                detail.year.toString(),
                style: const TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: detail.genreNames.length,
              itemBuilder: (context, index) {
                final genre = detail.genreNames[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 4,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color.fromRGBO(
                          255,
                          172,
                          172,
                          0.895,
                        ),
                      ),
                    ),
                    child: Text(
                      genre,
                      style: const TextStyle(
                        color: Color.fromRGBO(
                          255,
                          172,
                          172,
                          0.895,
                        ),
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            detail.overview,
            style: const TextStyle(
              color: Color.fromRGBO(255, 172, 172, 0.895),
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Rating: ${detail.userRating}',
                style: const TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              Text(
                'Relevance: ${detail.relevance?.toStringAsFixed(2)} %',
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
    );
  }
}
