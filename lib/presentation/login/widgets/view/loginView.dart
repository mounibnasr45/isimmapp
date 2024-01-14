import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:isimm_app2/presentation/login/widgets/widget/choice_button.dart';
import 'package:isimm_app2/presentation/login/widgets/widget/log/sign_button.dart';
import 'package:isimm_app2/presentation/login/widgets/widget/password_field.dart';
import 'package:isimm_app2/presentation/resources/assets_manager.dart';
import 'package:isimm_app2/presentation/resources/color_manager.dart';
import 'package:isimm_app2/presentation/resources/routes_manager.dart';
import 'package:isimm_app2/presentation/signup/widgets/emailfield.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../../../services/authentication.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginViewState();
}

class _LoginViewState extends State<Loginview> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool val = false;
  int selected = 1;

  login() async {
    if (await Auth.loginIn(
        email: emailController.text,
        password: passwordController.text,
        context: context)) {
      Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Image.asset(
                ImageManager.higher_logo,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),

              //color: Colors.cyan,
              height: 593,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                // Add your desired background color here
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      choice1_button(1, "Login", signup_func),
                      SizedBox(
                        width: 5,
                      ),
                      choice1_button(0, "SignUp", signup_func),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EmailField(controller: emailController),
                        SizedBox(
                          height: 10,
                        ),
                        PasswordField(controller: passwordController),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Color.fromARGB(255, 47, 125, 203),
                              value: val,
                              onChanged: (select) {
                                setState(() {
                                  val = !val;
                                });
                              },
                            ),
                            Text(
                              "Remember me",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: RichText(
                                text: TextSpan(
                                  text: 'Forgot password',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Sign_log_button(
                          label: "Login",
                          onPressed: () {
                            login();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  or_sign_with(),
                  SizedBox(
                    height: 30,
                  ),
                  sign_button_with(),
                  // SizedBox(
                  //   height: 30,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SignInButtonBuilder sign_button_with() {
    return SignInButtonBuilder(
      text: 'Sign in with Email',
      icon: Icons.email,
      onPressed: () {},
      backgroundColor: Colors.blueGrey.shade700,
    );
  }

  Row or_sign_with() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
            indent: 10,
            endIndent: 0,
          ),
        ),
        SizedBox(width: 20),
        Text(
          'Or sign in with',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
            indent: 10,
            endIndent: 0,
          ),
        ),
      ],
    );
  }

  void login_func() {}

  void signup_func() {
    Navigator.pushReplacementNamed(context, Routes.signup);
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Your button click logic here
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      },
      child: Text(label),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
          ),
        ),
      ),
    );
  }
}
