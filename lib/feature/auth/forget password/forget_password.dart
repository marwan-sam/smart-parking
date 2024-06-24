import 'package:flutter/material.dart';
import 'package:smart_parking/feature/auth/forget%20password/reset%20by%20email/reset_by_email.dart';
import 'package:smart_parking/feature/shared/AppBarDetails.dart';
import 'package:smart_parking/feature/shared/custom_button.dart';
import 'forget_password_phone_number.dart';

class ForgetPassword extends StatelessWidget {
  //static const RouteName = "ForgetPassword";

  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context: context),
      body: Builder(builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset('assets/images/ForgetPassword.png'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                // Add horizontal padding
                child: Text(
                  "Select which Contact Details we have to use to reset your Password",
                  style: TextStyle(
                    fontSize: 16, // Adjust the font size if needed
                  ),
                ),
              ),
              const SizedBox(width: 25, height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20), // Adjust horizontal padding as needed
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ForgetPasswordByPhoneNumber(),
                        ));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white60),
                    minimumSize: WidgetStateProperty.all(const Size(350, 70)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.phone, // Replace with your desired icon
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(width: 10), // Adjust the width as needed
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reset by phone number",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5), // Adjust the height for spacing
                          Text(
                            "0122 - - - - 389",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 25, height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20), // Adjust horizontal padding as needed
                child: ElevatedButton(
                  onPressed: () {
                    // email
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ForgetPasswordByPhoneNumber(),
                        ));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white60),
                    minimumSize: WidgetStateProperty.all(const Size(350, 70)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email, // Replace with your desired icon
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(width: 10), // Adjust the width as needed
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reset by Email address",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5), // Adjust the height for spacing
                          Text(
                            "AHmedYounis-----@gmail.com",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 220),
                  // Adjust the left padding as needed
                  child: CustomButton(
                      title: "Continue",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetByEmail(),
                            ));
                      }))
            ],
          ),
        );
      }),
    );
  }
}
