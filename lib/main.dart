import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vorstu/feature/home-screen/view/waiting.dart';
import 'package:vorstu/feature/login_screen/view/login_screen.dart';
import 'package:vorstu/feature/order-screen/view/order.dart';
import 'package:vorstu/service/auth-service.dart';
import 'package:vorstu/widgets/button.dart';

import 'feature/home-screen/view/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void processResponse(String response){
    log("processResponse");
    var authorities = jsonDecode(response)['authorities'];
    if(authorities[0]['authority'] == 'CUSTOMER'){
      Navigator.of(context).pushNamed('/home');
    } else {
      Navigator.of(context).pushNamed('/not-implemented');
    }
  }

  void _loadUserInfo(){
    AuthService.loadCookie()
        .then((value){
          AuthService.headers['Cookie'] = value;

          AuthService.getPrincipal("http://192.168.0.109:8080/api/auth/login")
              .then((response) => processResponse(response))
              .catchError(() => Navigator.of(context).pushNamed('/login'));
        })
        .catchError(() => Navigator.of(context).pushNamed('/login'));
    ;
  }

  @override
  void initState(){
    super.initState();
    _loadUserInfo();
  }

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
        scaffoldBackgroundColor: Color.fromARGB(255, 85, 67, 57),
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeView(title: "PiterBurger"),
        '/order': (context) => OrderView(),
        '/not-implemented': (context) => Text("Not implemented now"),
      },
      home: Builder(
          builder: (context) => Button(
            onPressed: () => Navigator.of(context).pushNamed('/home'), title: 'Нажмите чтобы продолжить'
          )
      ),
    );
  }
}
