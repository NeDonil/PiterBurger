import 'package:flutter/material.dart';

import 'feature/home-screen/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 10,
          backgroundColor: Color.fromRGBO(255, 227, 202, 1.0),
          shadowColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          )
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(255, 227, 202, 1.0),
      ),
      home: const HomeView(title: 'PiterBurger'),
    );
  }
}
