import 'package:assignment/app_config.dart';
import 'package:flutter/material.dart';

final config = AppConfig(
  watchmodeBaseUrl: Uri.parse('https://api.watchmode.com/v1'),
  watchmodeApiKey: 'Idsv1VxxFK80sxF2ES89OlOIB2kSxmQNXj6RuPeB',
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(title: 'Sources'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

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
        title: Text(
          widget.title,
          style: const TextStyle(
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
