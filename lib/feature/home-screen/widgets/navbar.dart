import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:vorstu/feature/profile/view/profile.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
      return FloatingNavBar(
          borderRadius: 20,
          selectedIconColor: Color.fromARGB(255, 85, 67, 57),
          unselectedIconColor: Color.fromRGBO(255, 227, 202, 1.0),
          horizontalPadding: 50,
          items: [
            FloatingNavBarItem(
              title: "Profile",
              page: ProfileView(),
              iconData : Icons.account_circle,
            ),
            FloatingNavBarItem(
                title: "Cart",
                page: ProfileView(),
                iconData : Icons.add_shopping_cart
            ),
          ],
          color: Color.fromRGBO(255, 227, 202, 1.0),
          hapticFeedback: true
      );
  }
}