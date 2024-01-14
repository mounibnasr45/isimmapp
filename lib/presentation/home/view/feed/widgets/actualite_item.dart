import 'package:flutter/material.dart';

class ActualiteItem extends StatelessWidget {
  final String name;
  final String image;
  final String place;
  final String date;

  const ActualiteItem({
    Key? key,
    required this.name,
    required this.image,
    required this.place,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      width: 250,
      height: 230.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 120),
          Container(
            height: 120,
            // margin: EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 20,
            width: 150,
            color: Color.fromARGB(171, 215, 203, 203),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: const Color.fromARGB(255, 160, 42, 34),
                  size: 18,
                ),
                Text(
                  date,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.apartment,
                color: const Color.fromARGB(255, 160, 42, 34),
                size: 18,
              ),
              Text(
                place,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                // Ajouter l'action à effectuer lors du clic sur "More details"
              },
              child: Text(
                "More details >>",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: const Color.fromARGB(255, 160, 42, 34),
                    ),
              ),
            ),
          ),
          // Positioned(
          //   top: 0,
          //   left: 3,
          //   child:
          // Container(
          //     margin: EdgeInsets.only(left: 25),
          //     decoration: BoxDecoration(
          //       color: Colors.black,
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20.0),
          //       child: Image.asset(
          //         image,
          //         fit: BoxFit.fitWidth,
          //       ),
          //     ),
          //   ),
          //  ),
        ],
      ),
    );
  }
}
