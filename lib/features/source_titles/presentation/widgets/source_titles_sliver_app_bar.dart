import 'dart:ui';

import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/common/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class SourceTitlesSliverAppBar extends StatelessWidget {
  const SourceTitlesSliverAppBar({
    super.key,
    required this.source,
  });

  final SourceSummary source;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 130,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black.withAlpha(128),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: const EdgeInsets.only(left: 10, bottom: 5, top: 5),
            title: Expanded(
              child: Row(
                spacing: 8,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 14,
                      color: Color.fromRGBO(255, 172, 172, 0.895),
                    ),
                  ),
                  Image.network(
                    source.logo100px,
                    width: 65,
                    height: 65,
                    fit: BoxFit.scaleDown,
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
                    source.name,
                    style: const TextStyle(
                      color: Color.fromRGBO(255, 172, 172, 0.895),
                      fontWeight: FontWeight.w200,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
