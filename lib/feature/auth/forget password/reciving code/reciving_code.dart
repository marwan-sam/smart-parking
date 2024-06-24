import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking/feature/auth/forget%20password/password%20and%20confirm%20password/new_password_confirm_password.dart';
import 'package:smart_parking/feature/auth/forget%20password/reciving%20code/reciving_code_navigator.dart';
import 'package:smart_parking/feature/auth/forget%20password/reciving%20code/reciving_code_view_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';
import 'package:smart_parking/feature/shared/AppBarDetails.dart';
import 'package:smart_parking/feature/shared/custom_button.dart';
import 'package:smart_parking/feature/shared/custom_text_form_field.dart';
import 'package:smart_parking/feature/shared/dialog_utils.dart';

class Recivingcode extends StatefulWidget {
  const Recivingcode({super.key, required this.email});

  final String? email;

  static const RecivingCode = "RecivingCode";

  @override
  State<Recivingcode> createState() => _RecivingcodeState();
}

class _RecivingcodeState extends State<Recivingcode>
    implements RecivingCodeNavigator {
  TextEditingController RecivingcodeController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  RecivingCodeViewModel viewModel =
      RecivingCodeViewModel(injectAuthRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          appBar: appBarWidget(context: context),
          body: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Verification code",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextFormField(
                            isPassword: false,
                            type: TextInputType.name,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please Enter code";
                              } else {
                                return null;
                              }
                            },
                            controller: RecivingcodeController,
                            hintText: "Enter verification code",
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            title: "Verify",
                            onPressed: () {
                              RecivingCodeFunction();
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PasswordAndConfirmPassword(
                                              email: widget.email),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading() {
    DialogUtils.showProgress(context, "Loading");
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
        isDismissible: isDismissible,
        negAction: negAction,
        posAction: posAction,
        posActionTitle: posActionTitle);
  }

  @override
  Future<void> navigate() async {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordAndConfirmPassword(email: widget.email),
        ));
  }

  void RecivingCodeFunction() {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      viewModel.RecivingCodeFunction(RecivingcodeController.text);
    }
  }
}
