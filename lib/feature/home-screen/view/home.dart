import 'package:flutter/material.dart';
import 'package:vorstu/feature/home-screen/widgets/navbar.dart';
import 'package:vorstu/feature/home-screen/widgets/widgets.dart';
import 'package:vorstu/widgets/header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: GroupList(),
      bottomNavigationBar: const Navbar()
    );
  }
}