import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';

class MyAppBarprofile extends StatelessWidget implements PreferredSizeWidget {
  MyAppBarprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pushReplacementNamed(context, Routes.HomeRoute),
      ),
      automaticallyImplyLeading: false,
      title: Text("Profile"),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
