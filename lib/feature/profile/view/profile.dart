import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vorstu/feature/profile/widgets/profile-actions.dart';
import 'package:vorstu/widgets/header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({ super.key });

  // Заменить реальным именем
  static const String username = 'Игнат';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 85, 67, 57),
      appBar: Header(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              username,
              style: TextStyle(
                color: Color.fromRGBO(255, 227, 202, 1.0),
                fontFamily: 'lora',
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            SizedBox(height: 20),
            ProfileActions(),
          ],
        )
      ),
    );
  }
}