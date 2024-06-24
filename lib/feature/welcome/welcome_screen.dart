import 'package:flutter/material.dart';
import 'package:smart_parking/feature/shared/custom_button.dart';
import 'book_and_pay.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // Align children at the start
          children: [
            Expanded(
              flex: 8,
              child: Image.asset(
                'assets/images/Hello_Screen.png',
              ),
            ),
            Expanded(
                flex: 2, child: Image.asset('assets/images/smartwelcome.png')),
            const SizedBox(height: 10),
            const Text(
              "The best parking applicantion for you",
              style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 15),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                title: "Next",
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const BookAndPay(),
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                  // Navigator.of(context).pushNamed(BookAndPay.RouteName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
