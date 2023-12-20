import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.onPressed,
    required this.title,
    this.height = 50,
    this.width = 200,
  }) : super(key: key);

  final void Function() onPressed;
  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        backgroundColor: const Color.fromRGBO(255, 227, 202, 1.0),
      ),
      onPressed: onPressed,
      child: Text(title, style: const TextStyle(
        color: Color.fromARGB(255, 85, 67, 57),
        fontSize: 24,
        fontFamily: 'lora'
      ),),
    );
  }
}