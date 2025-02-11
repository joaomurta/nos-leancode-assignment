import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/features/source_title_detail/viewModel/source_title_detail_state.dart';
import 'package:flutter/material.dart';

class SourceTitleDetailHeader extends StatelessWidget {
  const SourceTitleDetailHeader({super.key, required this.detail});

  final SourceTitleDetailState detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Image.network(
          alignment: Alignment.centerLeft,
          detail.poster,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2.6,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const LoadingWidget();
          },
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey,
            width: double.infinity,
            height: double.infinity,
            child: const Icon(Icons.error),
          ),
        ),
        Text(
          detail.title,
          style: const TextStyle(
            color: Color.fromRGBO(255, 172, 172, 0.895),
            fontSize: 35,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
