import 'package:assignment/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Widget horizontalList1 = Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            spacing: 8,
            children: [
              InkWell(
                onTap: () => context.push(AppRoutes.sourceTitles),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(124, 54, 33, 25),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromRGBO(82, 49, 36, 1),
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Image.network(
                          'https://www.motoxpert.pt/sh_website_category_page/static/src/img/default.png',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          'Source Name',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 172, 172, 0.895),
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(124, 54, 33, 25),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(82, 49, 36, 1),
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Image.network(
                        'https://www.motoxpert.pt/sh_website_category_page/static/src/img/default.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        'Source Name',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(124, 54, 33, 25),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(82, 49, 36, 1),
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Image.network(
                        'https://www.motoxpert.pt/sh_website_category_page/static/src/img/default.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        'Source Name',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(124, 54, 33, 25),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(82, 49, 36, 1),
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Image.network(
                        'https://www.motoxpert.pt/sh_website_category_page/static/src/img/default.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        'Source Name',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(124, 54, 33, 25),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(82, 49, 36, 1),
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Image.network(
                        'https://www.motoxpert.pt/sh_website_category_page/static/src/img/default.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        'Source Name',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 172, 172, 0.895),
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const Text(
          'Sources',
          style: TextStyle(
            color: Color.fromRGBO(255, 172, 172, 0.895),
            fontWeight: FontWeight.w200,
            fontSize: 34,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 1',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 2',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 3',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 4',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 5',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Section 6',
                style: TextStyle(
                  color: Color.fromRGBO(255, 172, 172, 0.895),
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
            ),
            horizontalList1,
          ],
        ),
      ),
    );
  }
}
