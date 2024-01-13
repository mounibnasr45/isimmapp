import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      //toolbarHeight: 90.0,
      title: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        // height: 100,
        // width: double.infinity,
        width: double.infinity,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                "assets/images/raslogo.png",
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "ISIMM",
              style: TextStyle(
                  fontFamily: "RobotoSlab-VariableFont_wght",
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            // Profile(
            //   userName: "mounib_nasr",
            //   // height: 70,
            //   // width: 75,
            // ),
            Column(
              children: [
                Container(
                    //      height: 50,
                    width: 45,
                    color: Colors.black,
                    child: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {},
                      iconSize: 30,
                      color: Colors.white,
                    )),
                Text(
                  "mounib",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}