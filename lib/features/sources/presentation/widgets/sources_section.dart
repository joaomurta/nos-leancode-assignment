import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/features/sources/presentation/widgets/sources_list.dart';
import 'package:flutter/material.dart';

class SourcesSection extends StatelessWidget {
  const SourcesSection({super.key, required this.title, required this.sources});

  final String title;
  final List<SourceSummary> sources;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: const TextStyle(
              color: Color.fromRGBO(255, 172, 172, 0.895),
              fontWeight: FontWeight.w300,
              fontSize: 24,
            ),
          ),
        ),
        SourcesListView(sources: sources),
      ],
    );
  }
}
