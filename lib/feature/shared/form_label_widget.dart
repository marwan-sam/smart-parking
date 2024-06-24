// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FormLabelWidget extends StatelessWidget {
  final String label;
  const FormLabelWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
          fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
    );
  }
}
