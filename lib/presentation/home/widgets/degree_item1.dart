import 'package:flutter/material.dart';

class DegreeItem1 extends StatefulWidget {
  const DegreeItem1({Key? key, required this.title, this.description = ''})
      : super(key: key);

  final String title;
  final String description;

  @override
  State<DegreeItem1> createState() => _DegreeItem1State();
}

class _DegreeItem1State extends State<DegreeItem1> {
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    print('Building DegreeItem1: ${widget.title}');
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15, left: 10, top: 20),
                  height: 90,
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // Set the border color to white
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      )),
                  child: Image.asset(
                    "assets/images/graduation1.jpg",
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Lorsqu'on appuie sur le texte
                          setState(() {
                            // Changez la couleur du texte en rouge
                            textColor = Colors.red;
                          });

                          // Attendez un moment (par exemple, 500 millisecondes)
                          Future.delayed(Duration(milliseconds: 500), () {
                            // Rechangez la couleur du texte à sa couleur d'origine
                            setState(() {
                              textColor = Colors.white;
                            });

                            // Naviguez vers une autre écran (remplacez 'YourNextScreen()' par la classe de votre écran de destination)
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => YourNextScreen()),
                            // );
                          });
                        },
                        child: Text(
                          widget.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 18, color: textColor),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            )
            // ListTile(
            //   leading:
            //       //Text(title),
            //       Image.asset(
            //     "assets/images/graduation1.jpg",
            //   ),
            //   title: Text(
            //     title,
            //     style: Theme.of(context)
            //         .textTheme
            //         .titleMedium!
            //         .copyWith(fontSize: 18, color: Colors.white),
            //   ),
            //   subtitle: Text(
            //     description,
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodySmall!
            //         .copyWith(fontSize: 14, color: Colors.white),
            //   ),
            // ),
            ),
        SizedBox(
          height: 10,
        ),
        Text(
          "                                                                     More details >>",
          style: TextStyle(color: Colors.red),
        ),
        Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}
