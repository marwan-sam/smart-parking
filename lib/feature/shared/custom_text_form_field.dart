import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String hintText;
  bool isPassword;
  TextEditingController controller;
  String? Function(String?)? validator;
  TextInputType type;

  CustomTextFormField(
      {super.key,
      required this.type,
      required this.validator,
      required this.controller,
      required this.hintText,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
          )),
      controller: controller,
      validator: validator,
      keyboardType: type,
      obscureText: isPassword,
    );
  }
}
