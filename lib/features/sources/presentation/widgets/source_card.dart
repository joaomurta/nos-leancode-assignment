import 'dart:convert';

import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:assignment/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SourceCard extends StatelessWidget {
  const SourceCard({super.key, required this.source});

  final SourceSummary source;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        SourceTitlesRoute($source: json.encode(source.toJson())).location,
      ),
      child: SizedBox(
        width: 165,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(124, 54, 33, 25),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color.fromRGBO(82, 49, 36, 1),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  source.logo100px,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const LoadingWidget();
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey,
                    width: 60,
                    height: 60,
                    child: const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  source.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 172, 172, 0.895),
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
