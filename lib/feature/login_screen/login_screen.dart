import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vorstu/service/auth-service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onLoginPressed(){
    final email = emailController.text;
    final password = passwordController.text;

    AuthService.sendAuthRequest("http://192.168.0.109:8080/api/auth/login", email, password)
      .then((value) => log(value))
      .catchError( (onError) => {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                  'Login error',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontFamily: 'lora', fontSize: 20
              ),
            )
          )
        )
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 227, 202, 1.0),
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: Text("PiterBurger"),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontFamily: 'default', fontSize: 80.0),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 50),

                TextField(
                    controller: emailController,
                    style: TextStyle(
                      fontFamily: 'lora',
                      fontSize: 20
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'name@email.com',
                    ),
                  ),
                const SizedBox(height: 10),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: const Color.fromRGBO(64, 57, 85, 1.0),
                    shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  onPressed: onLoginPressed,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontFamily: 'lora', fontSize: 20),

                  )
                )
              ],
            ),
          )
        )
      ),
    );
  }
}