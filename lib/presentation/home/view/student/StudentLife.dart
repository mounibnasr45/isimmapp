import 'package:flutter/material.dart';

import '../../../resources/routes_manager.dart';

class StudentLife extends StatefulWidget {
  const StudentLife({super.key});

  @override
  State<StudentLife> createState() => _StudentLifeState();
}

class _StudentLifeState extends State<StudentLife> {
  List Services = [
    [Icons.bookmark_outlined, "Courses", "12 models"],
    [Icons.schedule, "Schedule", "7 models"],
    [Icons.diversity_3_sharp, "Clubs", "4 models"],
    [Icons.maps_home_work_sharp, "Marks", "7 models"],
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
                    modeles: Services[index][2],
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

  Container TextIntro(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Models — Student life",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Hey UserName,",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "Maximize your academic potential with Notion's student templates. Easily organize your class notes, homework and projects. Keep track of your grades and goals, and improve your academic performance with Notion.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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
      //height: 100,
      child: Image.asset(
        'assets/images/isimm_taswir.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  ServiceItem(
      {super.key,
      required this.modeles,
      required this.name,
      required this.i,
      required this.index});
  String name, modeles;
  IconData i;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (name == "Courses")
          Navigator.pushReplacementNamed(context, Routes.chapterRoute);
        if (index == 1)
          Navigator.pushReplacementNamed(context, Routes.scheduleRoute);
        if (index == 0)
          Navigator.pushReplacementNamed(context, Routes.chapterRoute);
        if (index == 0)
          Navigator.pushReplacementNamed(context, Routes.chapterRoute);
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
            Text(
              modeles,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
