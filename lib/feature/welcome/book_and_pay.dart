import 'package:flutter/material.dart';
import 'package:smart_parking/feature/shared/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../auth/login/login_screen.dart';

class BookAndPay extends StatefulWidget {
  const BookAndPay({super.key});

  @override
  State<BookAndPay> createState() => _BookAndPayState();
}

class _BookAndPayState extends State<BookAndPay> {
  late PageController controller =
      PageController(viewportFraction: 0.8, keepPage: true);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(70)),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: Colors.red,
                dotColor: Colors.red.withOpacity(0.4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                  title: "Next",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

List pages = [
  Column(children: [
    Expanded(
      flex: 5,
      child: Image.asset('assets/images/BookAndPay.png'),
    ),
    const SizedBox(
      height: 70,
    ),
    Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child:
              Image.asset("assets/images/PayText.png", fit: BoxFit.scaleDown),
        )),
  ]),
  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Image.asset('assets/images/ExtendParking.png'),
          )),
      const SizedBox(
        height: 70,
      ),
      Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Image.asset(
              "assets/images/TextExtendParkingTime.png",
              fit: BoxFit.scaleDown,
            ),
          )),
    ],
  ),
  Column(
    children: [
      Expanded(flex: 7, child: Image.asset('assets/images/parking2.png')),
      const SizedBox(
        height: 70,
      ),
      Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Image.asset("assets/images/FindParkingPlaces.png",
                fit: BoxFit.scaleDown),
          )),
    ],
  ),
];
