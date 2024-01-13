// import 'package:flutter/material.dart';
// import 'package:isimm_app2/presentation/login/widgets/widget/choice_button.dart';
// import 'package:isimm_app/presentation/login/widgets/widget/textfield.dart';
// import 'package:isimm_app/presentation/resources/assets_manager.dart';
// import 'package:isimm_app/presentation/resources/routes_manager.dart';
// import 'package:isimm_app/presentation/signup/widgets/signup_button.dart';
// import 'package:sign_in_button/sign_in_button.dart';
// import 'package:smart_listview_builder/smart_listview_builder.dart';

// class SignUpView extends StatefulWidget {
//   const SignUpView({super.key});

//   @override
//   State<SignUpView> createState() => _SignUpViewState();
// }

// class _SignUpViewState extends State<SignUpView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 120,
//             ),
//             Image.asset(
//               "assets/images/higher_logo.png",
//             ),
//             SizedBox(
//               height: 120,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 choice1_button(0, "Login", login_func),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 choice1_button(1, "SignUp", signup_func),
//               ],
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//               //color: Colors.black,
//               height: 280,
//               padding: EdgeInsets.only(left: 20, right: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   EmailTextFiled(nom: 'Name '),
//                   EmailTextFiled(nom: 'Email or phone number'),
//                   MdpTextFiled(),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   SignUp_Button(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         color: Colors.white,
//       ),
//     );
//   }

//   void login_func() {
//     Navigator.pushReplacementNamed(context, Routes.loginRoute);
//   }

//   void signup_func() {}
// }
/************************** */
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:isimm_app2/Student_repository/student_repo.dart';
import 'package:isimm_app2/presentation/login/widgets/widget/choice_button.dart';
import 'package:isimm_app2/presentation/login/widgets/widget/dropdownbutton.dart';

import 'package:isimm_app2/presentation/login/widgets/widget/password_field.dart';
import 'package:isimm_app2/presentation/login/widgets/widget/textfield.dart';

import 'package:isimm_app2/presentation/resources/routes_manager.dart';
import 'package:isimm_app2/presentation/signup/widgets/emailfield.dart';
import 'package:isimm_app2/services/authentication.dart';

import '../../login/widgets/widget/log/sign_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  int selected = 1;

  signUp() async {
    Student1 student = Student1(
        firstName: FirstNameController.text.trim(),
        lastName: LastNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  
    String status = await Auth.signUp(student: student);

    if (status=='ok') {
         showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Mrigeul"),
          content: Text("jwk BEHI...!!"),
          actions: [
            ElevatedButton(
              child: Text("Ok"),
              onPressed: () {
                 Navigator.of(context).pushReplacementNamed('/login');
              },
            )
          ],
        );
      },
    );
          
    }
    else{
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(status+ "An error occurred"),
          actions: [
            ElevatedButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              // color: Color.fromARGB(255, 55, 154, 196),
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Image.asset(
                    "assets/images/higher_logo.png",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
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
                      choice1_button(0, "Login", login_func),
                      SizedBox(width: 5),
                      choice1_button(1, "SignUp", signup_func),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 300,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        names(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Speciality",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 97, 93, 93),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                color: Colors.black,
                                height: 50,
                                width: 130,
                                child: DropDownButton()),
                          ],
                        ),
                        EmailField(controller: emailController),
                        PasswordField(controller: passwordController),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Sign_log_button(
                            label: "SignUp",
                            onPressed: () {
                              signUp();
                            },
                          ),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  // SignInButtonBuilder(
                  //   text: 'Sign in with Email1',
                  //   icon: Icons.email,
                  //   onPressed: login_func,
                  //   backgroundColor: Colors.blueGrey.shade700,
                  // ),
                  // SizedBox(
                  //   height: 30,
                  // )
                ],
              ),
            ),
          ],
        ),
        color: Color.fromARGB(255, 55, 154, 196),
      ),
    );
  }

  Container names() {
    return Container(
      width: 400,
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: EmailTextFiled(
              nom: 'First Name',
              textEditingController: FirstNameController,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: EmailTextFiled(
              nom: 'Last Name',
              textEditingController: LastNameController,
            ),
          ),
        ],
      ),
    );
  }

  void login_func() {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  void signup_func() {}
}
