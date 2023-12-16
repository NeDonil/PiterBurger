import 'package:flutter/material.dart';

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
      home: const MainPage(title: 'PiterBurger'),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          toolbarHeight: 100.0,
          title: Text(title),
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.black, fontFamily: 'default', fontSize: 80.0),
        ),
      )
    );
  }
}
