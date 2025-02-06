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
                        size: 20,
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
                return ListTile(
                  title: Text('Item $index'),
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
