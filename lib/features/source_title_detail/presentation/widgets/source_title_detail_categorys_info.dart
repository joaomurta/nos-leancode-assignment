import 'package:assignment/common/extensions/title_type_extension.dart';
import 'package:assignment/features/source_title_detail/viewModel/source_title_detail_state.dart';
import 'package:flutter/material.dart';

class SourceTitleDetailCategorysInfo extends StatelessWidget {
  const SourceTitleDetailCategorysInfo({super.key, required this.detail});

  final SourceTitleDetailState detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
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
                detail.type.nameDescription,
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
      ],
    );
  }
}
