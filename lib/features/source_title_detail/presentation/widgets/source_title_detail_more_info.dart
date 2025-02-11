import 'package:assignment/features/source_title_detail/viewModel/source_title_detail_state.dart';
import 'package:flutter/material.dart';

class SourceTitleDetailMoreInfo extends StatelessWidget {
  const SourceTitleDetailMoreInfo({super.key, required this.detail});

  final SourceTitleDetailState detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
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
    );
  }
}
