import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking/feature/auth/login/login_screen.dart';
import 'package:smart_parking/feature/auth/register/register_navigator.dart';
import 'package:smart_parking/feature/auth/register/register_view_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';
import 'package:smart_parking/feature/home/parking_details_screen.dart';
import 'package:smart_parking/feature/shared/custom_button.dart';
import 'package:smart_parking/feature/shared/custom_text_form_field.dart';
import 'package:smart_parking/feature/shared/dialog_utils.dart';
import 'package:smart_parking/feature/shared/form_label_field.dart';

// ignore: must_be_immutable
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView>
    implements RegisterNavigator {
  // static const RouteName = "SignInScreen";
  TextEditingController namecontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  RegisterViewModel viewModel = RegisterViewModel(injectAuthRepository());

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;

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
              // Handle the action when the back arrow is pressed
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Builder(builder: (context) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/SignUpText.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                          key: formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 30,
                                width: 10,
                              ),
                              FormLabelWidget(label: "Name"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
                                type: TextInputType.name,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please Enter your Name";
                                    // } else {
                                    //   null;
                                  }
                                  return null;
                                },
                                controller: namecontroller,
                                hintText: "Enter Your Name",
                              ),
                              const SizedBox(
                                height: 30,
                                width: 10,
                              ),
                              FormLabelWidget(label: "Email Address"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
                                type: TextInputType.emailAddress,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please Enter your Email";
                                  }
                                  var emailvalid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(text);
                                  if (!emailvalid) {
                                    return "Email not valid";
                                  }
                                  return null;
                                },
                                controller: emailcontroller,
                                hintText: "Please Enter Your Email",
                              ),
                              const SizedBox(
                                height: 20,
                                width: 10,
                              ),
                              FormLabelWidget(label: "Phone Number"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
                                type: TextInputType.phone,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please Enter your phone Number";
                                  }
                                  if (text.trim().length < 10) {
                                    return "Phone number must be 10 numbers.";
                                  }
                                  return null;
                                },
                                controller: phonecontroller,
                                hintText: "Please Enter your Phone number",
                              ),
                              const SizedBox(
                                height: 20,
                                width: 10,
                              ),
                              FormLabelWidget(label: "Password"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
                                type: TextInputType.visiblePassword,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please Enter your Password";
                                  }
                                  if (text.length < 6) {
                                    return " Phone number must be more than 6 charc.";
                                  }
                                  return null;
                                },
                                controller: passwordcontroller,
                                isPassword: true,
                                hintText: "Please Enter your Password",
                              ),
                              const SizedBox(
                                height: 20,
                                width: 10,
                              ),
                              FormLabelWidget(label: "Confirm Password"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
                                type: TextInputType.visiblePassword,
                                isPassword: true,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please Enter Confirmation Password";
                                  }
                                  if (confirmPasswordController.text != text) {
                                    return "Password Dosen't Match";
                                  }
                                  return null;
                                },
                                controller: confirmPasswordController,
                                hintText: "Confirm Your Password",
                              ),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomButton(
                                title: "Sign Up",
                                onPressed: () {
                                  registerAction();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ParkingDetailsScreen(),
                                    ),
                                  );
                                  // Perform login logic here using the email and password
                                },
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void registerAction() {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      viewModel.register(
          namecontroller.text,
          phonecontroller.text,
          emailcontroller.text,
          passwordcontroller.text,
          confirmPasswordController.text);
    }
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
    // hide the success dialog
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading() {
    DialogUtils.showProgress(context, "Loading");
  }
}
