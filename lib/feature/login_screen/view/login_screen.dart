import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vorstu/service/auth-service.dart';
import 'package:vorstu/widgets/button.dart';
import 'package:vorstu/widgets/header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
      .then((value) => Navigator.of(context).popAndPushNamed('/home'))
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
      appBar: const Header(),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 50),

                TextField(
                    controller: emailController,
                    style: const TextStyle(
                      fontFamily: 'lora',
                      fontSize: 20
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'name@email.com',
                    ),
                  ),
                const SizedBox(height: 10),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                  ),
                ),
                const SizedBox(height: 20),
                Button(onPressed: onLoginPressed, title: 'Login')
              ],
            ),
          )
        )
      ),
    );
  }
}