import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Color.fromARGB(255, 85, 67, 57),
          fontFamily: 'lora',
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      )
    );
  }
}