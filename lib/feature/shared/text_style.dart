import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StyleText extends StatelessWidget {
  String texts;
  StyleText(this.texts, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      texts,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 20),
    );
  }
}
