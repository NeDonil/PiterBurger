import 'package:flutter/material.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({ super.key });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      child: Divider(
        color: Color.fromARGB(255, 85, 67, 57),
      ),
    );
  }
}