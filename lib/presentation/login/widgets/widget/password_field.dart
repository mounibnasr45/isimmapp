import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller; // Add this line

  PasswordField({Key? key, required this.controller})
      : super(key: key); // Modify this line

  @override
  Widget build(BuildContext context) {
    bool _isHidden = true;

    void _toggleVisibility() {
      _isHidden = !_isHidden;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: TextField(
        obscureText: _isHidden,
        controller: controller, // Pass the controller to the TextField
        style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
            onPressed: _toggleVisibility,
          ),
          border: InputBorder.none,
          hintText: "Password",
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
