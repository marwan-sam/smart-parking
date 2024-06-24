import 'package:flutter/material.dart';
import 'package:smart_parking/feature/auth/forget%20password/reciving%20code/reciving_code.dart';
import 'package:smart_parking/feature/auth/forget%20password/reset%20by%20email/reset_by_email_navigator.dart';
import 'package:smart_parking/feature/auth/forget%20password/reset%20by%20email/reset_by_email_view_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';
import 'package:smart_parking/feature/shared/custom_button.dart';
import 'package:smart_parking/feature/shared/custom_text_form_field.dart';
import 'package:smart_parking/feature/shared/dialog_utils.dart';
import 'package:smart_parking/feature/shared/form_label_field.dart';

class ResetByEmail extends StatefulWidget {
  const ResetByEmail({super.key});

  @override
  State<ResetByEmail> createState() => _ResetByEmailState();
}

class _ResetByEmailState extends State<ResetByEmail>
    implements ResetByEmailNavigator {
  TextEditingController resetByEmailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ResetByEmailViewModel viewModel =
      ResetByEmailViewModel(injectAuthRepository());
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
              width: 10,
            ),
            FormLabelWidget(label: "Email Address"),
            const SizedBox(
              height: 20,
              width: 10,
            ),
            Form(
              key: formKey,
              child: CustomTextFormField(
                isPassword: false,
                type: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return "Please Enter your Email";
                  }
                  var emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(text);
                  if (!emailValid) {
                    return "Email not valid";
                  }
                  return null;
                },
                controller: resetByEmailController,
                hintText: "Please Enter Your Email",
              ),
            ),
            const SizedBox(
              height: 30,
              width: 20,
            ),

            //Todo must handle button when to navigate
            CustomButton(
              title: "Send",
              onPressed: () {
                resetByEmailFunction();
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Recivingcode(email: viewModel.email)),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showMessage(
    String message, {
    String? posActionTitle,
    String? negActionTitle,
    VoidCallback? posAction,
    VoidCallback? negAction,
    bool isDismissible = true,
  }) {
    DialogUtils.showMessage(
      context,
      message,
      isDismissible: isDismissible,
      negAction: negAction,
      posAction: posAction,
      posActionTitle: posActionTitle,
    );
  }

  @override
  void showLoading() {
    DialogUtils.showProgress(context, "Loading");
  }

  @override
  Future<void> navigate() async {
    Navigator.pop(context);

    ///Todo must check where to navigate
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Recivingcode(email: AutofillHints.email),
        ));
  }

  void resetByEmailFunction() {
    if (formKey.currentState!.validate() == false) {
      return;
    } else {
      viewModel.resetByEmailFunction(resetByEmailController.text);
    }
  }
}
