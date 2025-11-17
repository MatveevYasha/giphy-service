import 'package:flutter/material.dart';
import 'package:giphy_service/home_page/Home_page.dart';

class AppRunner extends StatelessWidget {
  const AppRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
