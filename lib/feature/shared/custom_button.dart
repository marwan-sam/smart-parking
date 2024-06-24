import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Size minimumSize;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = Colors.black,
    this.minimumSize = const Size(370, 50),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: minimumSize.height,
      width: minimumSize.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          minimumSize: WidgetStateProperty.all(minimumSize),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function()? onPressed;

  CustomButton({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black, // Set the background color to black
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),

          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            // Set text color to white
          ),
        ),
      ),
    );
  }
}

 */