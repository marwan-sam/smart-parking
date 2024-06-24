import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_parking/feature/home/home_booking_view.dart';
import 'package:smart_parking/feature/setting/settings_ui.dart';
import 'package:smart_parking/feature/ticket/ticket_view.dart';

class TabsHome extends StatefulWidget {
  final int? selectedIndex;

  const TabsHome({super.key, this.selectedIndex});

  @override
  State<TabsHome> createState() => _TabsHomeState();
}

class _TabsHomeState extends State<TabsHome> {
  final tabs = [
    const HomeBookingView(),
    const TicketUI(),
    const SettingsUI(),
  ];

  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) => setState(() {
          selectedIndex = value;
        }),
        selectedItemColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black.withOpacity(0.5)
            : Colors.white.withOpacity(0.7),
        unselectedItemColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black.withOpacity(0.5)
            : Colors.white.withOpacity(0.7),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25.w,
            ),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplane_ticket,
              size: 25.w,
            ),
            label: "Ticket",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 25.w,
            ),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
