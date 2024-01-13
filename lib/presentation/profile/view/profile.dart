import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/myappbar.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  TextEditingController FNcontroller = TextEditingController();
  TextEditingController LNcontroller = TextEditingController();
  TextEditingController TDcontroller = TextEditingController();
  TextEditingController PHcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarprofile(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 130,
                width: double.infinity,
               
                child: Image.asset("assets/images/profile_background.png"),
              ),
            ],
          ),
          Positioned(
            left: 35,
            top: 75,
            child: Container(
              height: 65,
              width: 65,
               decoration: BoxDecoration(
          color: Color.fromARGB(255, 148, 198, 221),
          borderRadius: BorderRadius.circular(18),
           border: Border.all(
      color: Colors.white,  // Couleur de la bordure
      width: 1.0,  // Largeur de la bordure
    ),
    
          ),
          child: Container(
  height: 65,
  width: 65,
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 148, 198, 221),
    borderRadius: BorderRadius.circular(18),
    border: Border.all(
      color: Colors.white,  // Couleur de la bordure
      width: 2.0,  // Largeur de la bordure
    ),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(18), // Appliquer le même rayon ici
    child: Image.asset(
      "assets/images/monicca.png",
      fit: BoxFit.cover,
    ),
  ),
)

            ),
          ),
          Consumer<EditProvider>(
            builder: (context, editProvider, child) {
              return Column(
                children: [
                  SizedBox(
                    height: 135,
                  ),
                  Container(
                    width: double.infinity,
                    //color: const Color.fromARGB(255, 33, 243, 138),
                    child: Column(
                      children: [
                        //edit profile
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                                onPressed: !Provider.of<EditProvider>(context,
                                            listen: false)
                                        .isEditing
                                    ? () {
                                        print("isEditing clic");
                                        Provider.of<EditProvider>(context,
                                                listen: false)
                                            .clic();
                                      }
                                    : () {
                                        print(Provider.of<EditProvider>(context,
                                                listen: false)
                                            .L[0] = FNcontroller.text);

                                        Provider.of<EditProvider>(context,
                                                listen: false)
                                            .L[0] = FNcontroller.text;
                                        Provider.of<EditProvider>(context,
                                                listen: false)
                                            .L[1] = LNcontroller.text;
                                        Provider.of<EditProvider>(context,
                                                listen: false)
                                            .L[2] = TDcontroller.text;
                                        Provider.of<EditProvider>(context,
                                                listen: false)
                                            .L[3] = PHcontroller.text;
                                        print("save clic");
                                        Provider.of<EditProvider>(context,
                                                listen: false)
                                            .clic_save();
                                      },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      Provider.of<EditProvider>(context,
                                                  listen: false)
                                              .isEditing
                                          ? "Save"
                                          : "Edit Profile",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Provider.of<EditProvider>(context,
                                                  listen: false)
                                              .isEditing
                                          ? Icons.check
                                          : Icons.mode_edit_outlined,
                                      color: Color.fromARGB(255, 27, 121, 210),
                                    )
                                  ],
                                )),
                          ),
                        ),

                        Provider.of<EditProvider>(context, listen: false)
                                .isEditing
                            ? EditableItem(
                                defaultText: Provider.of<EditProvider>(context,
                                        listen: false)
                                    .L[0] ,
                                label: "FirstName",
                                controller: FNcontroller,
                                index0: 0,
                              )
                            : Item(
                                index: 0,
                                i: Icons.person,
                                name: Provider.of<EditProvider>(context,
                                        listen: false)
                                    .L[0]),
                        Provider.of<EditProvider>(context, listen: false)
                                .isEditing
                            ? EditableItem(
                               defaultText: Provider.of<EditProvider>(context,
                                        listen: false)
                                    .L[1] ,
                                label: "LastName",
                                controller: LNcontroller,
                                index0: 1,
                              )
                            : Item(
                                index: 1,
                                i: Icons.person,
                                name: Provider.of<EditProvider>(context,
                                        listen: false)
                                    .L[1]),
                        Provider.of<EditProvider>(context, listen: false)
                                .isEditing
                            ? EditableItem(
                               defaultText: Provider.of<EditProvider>(context,
                                        listen: false)
                                    .L[2] ,
                                label: "TD",
                                controller: TDcontroller,
                                index0: 2,
                              )
                            : Item(
                                index: 2,
                                i: Icons.school,
                                name: Provider.of<EditProvider>(context,
                                        listen: false)
                                    .L[2]),
                        Provider.of<EditProvider>(context, listen: false)
                                .isEditing
                            ? EditableItem(
                               defaultText: Provider.of<EditProvider>(context,
                                        listen: false)
                                    .L[3] ,
                                label: "Phone",
                                controller: PHcontroller,
                                index0: 3,
                              )
                            : Item(
                                index: 3,
                                i: Icons.phone_enabled_outlined,
                                name: Provider.of<EditProvider>(context,
                                        listen: false)
                                    .L[3]),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

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
      // color: Color.fromARGB(182, 219, 215, 215),
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

class EditProvider with ChangeNotifier {
  bool _isEditing = false;
  List<String> _l = ["Monicca", "Belluci", "L3_INFO", "+21650239112"];

  bool get isEditing => _isEditing;
  List<String> get L => _l;

  void clic() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void clic_save() {
    _isEditing = !isEditing;
    notifyListeners();
  }
}

class EditableItem extends StatelessWidget {
  final String label;
  final int index0;
   final String defaultText;
  TextEditingController controller;
  EditableItem(
      {required this.label,
      required this.index0,
      required this.controller,
      this.defaultText = "",
      Key? key})
       : super(key: key) {
    // Set the default text when the controller is initialized
    controller.text = defaultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 148, 198, 221),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 7),
      child: Row(
        children: [
          SizedBox(width: 30),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: label,
              ),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
