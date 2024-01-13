import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item(
      {required this.i, required this.name, required this.index, super.key});
  final IconData i;
  final String name;
  final int index;
  static List<String> L = ["FirstName:", "LastName:", "TD:", "Phone:"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 148, 198, 221),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 7),
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Text(
            L[index],
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Icon(
            i,
            size: 24,
            color: Color.fromARGB(255, 27, 121, 210),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
