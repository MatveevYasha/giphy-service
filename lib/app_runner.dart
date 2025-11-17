import 'package:flutter/material.dart';
import 'package:giphy_service/scr/feature/home/home_page.dart';

class AppRunner extends StatelessWidget {
  const AppRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
