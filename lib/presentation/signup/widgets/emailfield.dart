import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller; // Add this line

  const EmailField({Key? key, required this.controller})
      : super(key: key); // Modify this line

  @override
  Widget build(BuildContext context) {
    return MaterialTextField(
      keyboardType: TextInputType.emailAddress,
      hint: 'Email',
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(Icons.email_outlined),
      suffixIcon: const Icon(Icons.check),
      controller: controller, // Pass the controller to MaterialTextField
      validator: FormValidation.emailTextField,
    );
  }
}
