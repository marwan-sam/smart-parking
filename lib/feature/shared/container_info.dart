import 'package:flutter/material.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({
    super.key,
    required this.w,
  });
  final Widget w;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(4, 6, 15, 0.05000000074505806),
            offset: Offset(0, 4),
            blurRadius: 60,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: w,
    );
  }
}
