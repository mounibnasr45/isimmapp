import 'package:flutter/material.dart';

import '../../../resources/routes_manager.dart';

class TeacherView extends StatelessWidget {
  TeacherView({super.key});
  List Services = [
    [
      Icons.schedule,
      "Schedule",
    ],
    [
      Icons.bookmark_outlined,
      "Add Courses",
    ],
    [
      Icons.newspaper,
      "Send News",
    ],
    [
      Icons.newspaper,
      "Send Marks",
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FirstImage(),
          TextIntro(context),
          Container(
            padding: EdgeInsets.all(15),
            //height: double.infinity,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: Services.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < Services.length) {
                  return ServiceItem(
                    name: Services[index][1],
                    i: Services[index][0],
                    index: index,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Container TextIntro(BuildContext context) {
  return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcom Mr(s) TeacherName",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 15,
          ),
          // Text(
          //   "Hey UserName,",
          //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //         fontSize: 18,
          //         fontWeight: FontWeight.w500,
          //       ),
          // ),
          RichText(
            //textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: '"',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'Stand up for the teacher and glorify him....He could have been a messenger.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                TextSpan(
                  text: '"',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),
        ],
      ));
}

Container FirstImage() {
  return Container(
    height: 220,
    child: Image.asset(
      'assets/images/teacherimg.jpg',
      fit: BoxFit.cover,
    ),
  );
}

class ServiceItem extends StatelessWidget {
  ServiceItem(
      {super.key, required this.name, required this.i, required this.index});
  String name;
  IconData i;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (name == "Add Courses")
          Navigator.pushReplacementNamed(context, Routes.chapterRoute);
        if (name == "Schedule")
          Navigator.pushReplacementNamed(context, Routes.schedule_teach);
        if (name == "Send News")
          Navigator.pushReplacementNamed(context, Routes.teachernews);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color.fromARGB(255, 151, 151, 151),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Icon(
              i,
              size: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
