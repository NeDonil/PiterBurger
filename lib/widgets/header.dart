import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  static const String title = 'PiterBurger';

  @override
  final Size preferredSize = const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        toolbarHeight: 100.0,
        title: const Text(title),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black, fontFamily: 'default', fontSize: 80.0),
      ),
    );
  }
}