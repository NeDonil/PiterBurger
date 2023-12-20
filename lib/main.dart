import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vorstu/feature/login_screen/view/login_screen.dart';
import 'package:vorstu/service/auth-service.dart';

import 'feature/home-screen/view/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AuthService.loadCookie()
    .then((value) => AuthService.headers['Cookie'] = value);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PiterBurger',
      debugShowCheckedModeBanner: false,
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
      home: FutureBuilder(
        future: AuthService.getPrincipal("http://192.168.0.109:8080/api/auth/login"),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }

            final authorities = jsonDecode(snapshot.data!)['authorities'];
            if(authorities[0]['authority'] == 'CUSTOMER'){
              return HomeView(title: "PiterBurger");
            } else {
              return Text("Not implemented now");
            }
          }

          return LoginScreen();
        }
      ),
    );
  }
}
