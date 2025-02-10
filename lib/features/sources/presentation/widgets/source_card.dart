import 'dart:convert';

import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
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
      child: Container(
        width: 165,
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
            spacing: 10,
            children: [
              Image.network(
                source.logo100px,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              Text(
                source.name,
                textAlign: TextAlign.center,
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
    );
  }
}
