import 'package:flutter/material.dart';

class Sign_log_button extends StatelessWidget {
  final VoidCallback onPressed; // Add this line

  const Sign_log_button(
      {super.key, required this.label, required this.onPressed});
  final String label;

  @override
  Widget build(
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(255, 47, 125, 203),
        ),
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
