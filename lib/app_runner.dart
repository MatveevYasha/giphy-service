import 'package:flutter/material.dart';
import 'package:giphy_service/scr/feature/router/router.dart';

class AppRunner extends StatelessWidget {
  const AppRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: $Router,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
    );
  }
}
