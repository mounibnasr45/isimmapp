import 'package:flutter/material.dart';
import 'package:isimm_app2/domain/module.dart';

class ModuleWidget extends StatelessWidget {
  final Module module;

  ModuleWidget(this.module);

  @override
  Widget build(BuildContext context) {
    // Customize the appearance of the Module widget here
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        module.name ?? "",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
