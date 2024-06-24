import 'package:flutter/material.dart';
import 'package:smart_parking/feature/auth/login/login_navigator.dart';
import 'package:smart_parking/feature/auth/login/login_view_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';
import 'package:smart_parking/feature/shared/custom_button.dart';
import 'package:smart_parking/feature/shared/custom_text_form_field.dart';
import 'package:smart_parking/feature/shared/dialog_utils.dart';
import 'package:smart_parking/feature/shared/form_label_field.dart';
import '../../home/tabs_home.dart';

import '../register/register_view.dart';
import '../forget password/forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  // GoogleSignIn googleSignIn = GoogleSignIn(
  //   scopes: <String>[
  //     'email',
  //     'https://www.googleapis.com/auth/contacts.readonly',
  //   ],
  // );

  Future<void> _handleGoogleSignIn() async {
    try {
      //await googleSignIn.signIn();
      // After signing in, perform actions or navigate to relevant screens
    } catch (error) {
      print('Google Sign-In error: $error');
    }
  }

  LoginViewModel viewModel = LoginViewModel(injectAuthRepository());
  @override
  void initState() {
    // TODO: implement initState
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
            Navigator.of(context)
                .pop(); // Handle the action when the back arrow is pressed
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset('assets/images/LoginText.png',
                      alignment: Alignment.center),
                  const SizedBox(
                    height: 30,
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
                  FormLabelWidget(label: "Password"),
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  CustomTextFormField(
                    type: TextInputType.visiblePassword,
                    isPassword: true,
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
                    hintText: "Please Enter your Password",
                  ),
                  const SizedBox(
                    height: 20,
                    width: 10,
                  ),
                  CustomButton(
                    title: "Login",
                    onPressed: () => loginAction(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPassword(),
                          ));
                    },
                    child: const Text("Forget Password ?"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterView(),
                              ));
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // need google sign in image not text
                      ElevatedButton(
                        onPressed: _handleGoogleSignIn,
                        child: Image.asset('assets/images/GoogleLoogle.png'),
                      ),

                      const SizedBox(width: 10),
                    ],
                  )
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
    // hide the success dialog
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TabsHome(),
        ));
  }

  void loginAction() {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      viewModel.login(emailcontroller.text, passwordcontroller.text);
    }
  }
}
