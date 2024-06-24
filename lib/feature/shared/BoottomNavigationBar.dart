import 'package:flutter/material.dart';

class BottomNavigationBarDetails extends StatefulWidget {
  const BottomNavigationBarDetails({super.key});

  @override
  State<BottomNavigationBarDetails> createState() =>
      _BottomNavigationBarDetailsState();
}

class _BottomNavigationBarDetailsState
    extends State<BottomNavigationBarDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(Icons.home, size: 31),
              Text(
                "Home",
              )
            ],
          ),
          Column(
            children: [
              Icon(Icons.airplane_ticket),
              Text(
                "Ticket",
              )
            ],
          ),
          Column(
            children: [
              Icon(Icons.search),
              Text(
                "History",
              )
            ],
          ),
          Column(
            children: [
              Icon(Icons.photo),
              Text(
                "Profile",
              )
            ],
          ),
        ],
      ),
    );
  }
}
