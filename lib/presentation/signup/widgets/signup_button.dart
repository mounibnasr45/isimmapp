import 'package:flutter/material.dart';
import 'package:isimm_app2/presentation/resources/routes_manager.dart';

class SignUp_Button extends StatelessWidget {
  const SignUp_Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      },
      child: Text('  SignUp  '),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the radius as needed
          ),
        ),
      ),
    );
  }
}
