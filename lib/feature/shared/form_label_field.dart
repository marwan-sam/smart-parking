// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormLabelWidget extends StatelessWidget {
  String label;
  FormLabelWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
