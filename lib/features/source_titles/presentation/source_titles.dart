import 'package:assignment/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SourceTitles extends StatefulWidget {
  const SourceTitles({super.key});

  @override
  State<SourceTitles> createState() {
    return _SourceTitlesState();
  }
}

class _SourceTitlesState extends State<SourceTitles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            expandedHeight: 150,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
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
                      'https://www.motoxpert.pt/sh_website_category_page/static/src/img/default.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Sources',
                      style: TextStyle(
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    height: 85,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(124, 54, 33, 25),
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
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Title Name',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 172, 172, 0.895),
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 6,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                    255,
                                    172,
                                    172,
                                    0.895,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ), // Large value for pill shape
                                ),
                                child: const Text(
                                  'Series Name',
                                  style: TextStyle(
                                    color: Color.fromARGB(124, 54, 33, 25),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const Text(
                                'Year',
                                style: TextStyle(
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
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
