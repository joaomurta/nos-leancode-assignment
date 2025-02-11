import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:flutter/material.dart';

class SourceTitlesListItem extends StatelessWidget {
  const SourceTitlesListItem({
    super.key,
    required this.sourceTitle,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  final TitleSummary sourceTitle;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 85,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(122, 132, 93, 78)
                : const Color.fromARGB(124, 54, 33, 25),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color.fromRGBO(82, 49, 36, 1),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sourceTitle.title,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 172, 172, 0.895),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    height: 0.95,
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
                        sourceTitle.type.name,
                        style: const TextStyle(
                          color: Color.fromARGB(124, 54, 33, 25),
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      sourceTitle.year.toString(),
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
          ),
        ),
      ),
    );
  }
}
