import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_parking/feature/shared/AppBarDetails.dart';

class ForgetPasswordByPhoneNumber extends StatelessWidget {
  const ForgetPasswordByPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Verification code",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    )),
                const SizedBox(
                  height: 12,
                ),
                const Text("We have sent the verification code to",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: const TextSpan(
                      text: "+98********56  ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: "Change Phone number?",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ))
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: textFormFieldDecoration,
                        cursorColor: Colors.black87,
                        textAlign: TextAlign.center,
                        cursorHeight: 30.0,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: textFormFieldDecoration,
                        cursorColor: Colors.black87,
                        textAlign: TextAlign.center,
                        cursorHeight: 30.0,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: textFormFieldDecoration,
                        cursorColor: Colors.black87,
                        textAlign: TextAlign.center,
                        cursorHeight: 30.0,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        },
                        decoration: textFormFieldDecoration,
                        cursorColor: Colors.black87,
                        textAlign: TextAlign.center,
                        cursorHeight: 30.0,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

InputDecoration textFormFieldDecoration = InputDecoration(
  hintText: "0",
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 2,
      color: Colors.black87,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      width: 3,
      color: Colors.black87,
    ),
  ),
);
