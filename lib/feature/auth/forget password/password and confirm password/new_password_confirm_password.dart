import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking/feature/auth/forget%20password/password%20and%20confirm%20password/forget_navigator.dart';
import 'package:smart_parking/feature/auth/forget%20password/password%20and%20confirm%20password/forget_view_model.dart';
import 'package:smart_parking/feature/auth/login/login_screen.dart';
import 'package:smart_parking/feature/auth/model/forget%20pass/forget_password_request_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';
import 'package:smart_parking/feature/shared/custom_text_form_field.dart';
import 'package:smart_parking/feature/shared/dialog_utils.dart';
import 'package:smart_parking/feature/shared/form_label_field.dart';

class PasswordAndConfirmPassword extends StatefulWidget {
  const PasswordAndConfirmPassword({super.key, required this.email});
  static const keyPasswordAndConfirmPassword = "Password_and_ConfirmPassword";

  final String? email;

  @override
  State<PasswordAndConfirmPassword> createState() =>
      _PasswordAndConfirmPasswordState();
}

class _PasswordAndConfirmPasswordState extends State<PasswordAndConfirmPassword>
    implements ForgetPasswordNavigator {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  ForgetPasswordViewModel viewModel =
      ForgetPasswordViewModel(injectAuthRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size screenSize = mediaQuery.size;

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FormLabelWidget(label: "New Password"),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    type: TextInputType.visiblePassword,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter a new password";
                      }
                      if (text.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                    controller: newPasswordController,
                    hintText: "New Password",
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FormLabelWidget(label: "Confirm New Password"),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    type: TextInputType.visiblePassword,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please confirm your new password";
                      }
                      if (text != newPasswordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    hintText: "Confirm New Password",
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      disabledBackgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                    ),
                    onPressed: () {
                      SetNewPassword();
                      if (formKey.currentState!.validate()) {
                        // Form is valid, proceed with password reset
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Verify',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
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
          builder: (context) => const LoginScreen(),
        ));
  }

  void SetNewPassword() {
    if (formKey.currentState!.validate()) {
      final model = ForgetPasswordRequestModel(
        //ToDo is done
        email: widget.email,
        //ToDo is done
        confirmPassword: newPasswordController.text,
        password: newPasswordController.text,
      );
      viewModel.ForgetPassword(model);
    }
  }
}
