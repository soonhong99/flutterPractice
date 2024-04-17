import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      required this.bgcolor,
      required this.textcolor});

  final String text;
  final Color bgcolor;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: bgcolor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Text(text,
            style: TextStyle(
                color: textcolor, fontSize: 18, fontWeight: FontWeight.w800)),
      ),
    );
  }
}
