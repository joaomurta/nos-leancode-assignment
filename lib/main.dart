import 'package:assignment/app_config.dart';
import 'package:assignment/core/navigation/router.dart';
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
    return MaterialApp.router(
      title: 'Sources',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      routerConfig: appRouter,
    );
  }
}
