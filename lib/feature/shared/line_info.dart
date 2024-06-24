import 'package:flutter/material.dart';

class LineInfo extends StatelessWidget {
  const LineInfo({super.key, required this.title, required this.desc});
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Color(0xFF616161),
              fontSize: 14,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
              height: 1.5,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            desc,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF070707),
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              height: 0.09,
              letterSpacing: 0.20,
            ),
          ),
        ],
      ),
    );
  }
}
