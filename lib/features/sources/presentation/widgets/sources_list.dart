import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/features/sources/presentation/widgets/source_card.dart';
import 'package:flutter/material.dart';

class SourcesListView extends StatelessWidget {
  const SourcesListView({super.key, required this.sources});

  final List<SourceSummary> sources;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 165,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        itemBuilder: (context, index) {
          final source = sources[index];
          return Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: SourceCard(source: source),
          );
        },
      ),
    );
  }
}
