import 'package:flutter/material.dart';
import '../../../domain/marks.dart';
import '../../../domain/module.dart';
import '../widgets/chaptrecard.dart';
import '../widgets/marksmodelview.dart';
import '../widgets/modulewigdet.dart';
// import 'modulCard.dart';
// import 'chapterCard.dart';

class Chapter extends StatefulWidget {
  final bool type;
  final String? id;

  Chapter({
    Key? key,
    required this.type,
    required this.id,
  }) : super(key: key);

  @override
  State<Chapter> createState() => _ChapterState(type, id);
}

class _ChapterState extends State<Chapter> {
  final bool type;

  String? id;
  _ChapterState(this.type, this.id);
  // final List<Module> mList = [
  //   Module("Module 1"),
  //   Module("Module 1"),
  //   Module("Module 1"),
  //   Module("Module 1"),
  //   Module("Module 1"),
  //   Module("Module 1"),
  //   Module("Module 1"),
  //   Module("Module 1"),
  //   Module("Module 1"),
  //   Module("Module 1"),
  // ];
  final List<ModuleWidget> mList = [
    ModuleWidget(
      Module("Module 1"),
    ),
    ModuleWidget(
      Module("Module 1"),
    ),
    ModuleWidget(
      Module("Module 1"),
    ),
    ModuleWidget(
      Module("Module 1"),
    ),
    ModuleWidget(
      Module("Module 1"),
    ),
    ModuleWidget(
      Module("Module 1"),
    ),
    ModuleWidget(
      Module("Module 1"),
    ),
    ModuleWidget(
      Module("Module 1"),
    ),
    ModuleWidget(
      Module("Module 1"),
    ),
    ModuleWidget(
      Module("Module 1"),
    ),
  ];
  final chList = [
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
  ];
  static const primaryColor = Color(0xFF007AFF);
//   static const c2 = Color(0xFF3282B8);
//   static const c3 = Color(0xB20F4C75);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title:
            // type
            //?
            const Text("Chapter management",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
        // : const Text("Chapters & Evaluation Browsing",
        //     style: TextStyle(
        //         color: primaryColor,
        //         fontSize: 16,
        //         fontWeight: FontWeight.w700)),
        leading: Container(
          height: 45,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/Logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 0, 20),
              child: Text(
                "Modules",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 66,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                // ListView.separated(
                //   separatorBuilder: (context, idx) => const Divider(),
                itemBuilder: (context, idx) {
                  return mList[idx];
                },
                scrollDirection: Axis.horizontal,
                itemCount: mList.length,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Chapters",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700)),
                            // GestureDetector(
                            //   onTap: () {
                            //     type
                            //         ? null
                            //         // ? Navigator.push(
                            //         //     context,
                            //         //     MaterialPageRoute(
                            //         //         builder: (context) =>
                            //         //             const fillChapter()))
                            //         : Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => Marks(
                            //                     MarksModelView(
                            //                         studentId: "2")
                            //                         )
                            //                         )
                            //                         );
                            //   },
                            //   child: Container(
                            //     height: 26,
                            //     width: 106,
                            //     decoration: BoxDecoration(
                            //         color: primaryColor,
                            //         borderRadius: BorderRadius.circular(10),
                            //         boxShadow: const [
                            //           BoxShadow(
                            //             color: Color(0x3282B833),
                            //             blurRadius: 8,
                            //             spreadRadius: 3,
                            //             offset: Offset(
                            //                 0, 4), // changes position of shadow
                            //           ),
                            //         ]),
                            //     child: Center(
                            //       child: Text(
                            //           type ? "ADD CHAPTER" : "CONSULT MARKS",
                            //           style: const TextStyle(
                            //               color: Colors.white,
                            //               fontSize: 12,
                            //               fontWeight: FontWeight.w700)),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            // ListView.separated(
                            //   separatorBuilder: (context, idx) => const Divider(),
                            itemBuilder: (context, idx) {
                              return chList[idx];
                            },
                            scrollDirection: Axis.vertical,
                            itemCount: chList.length,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// //import 'package:flutter/isimm_appmaterial.dart';
// import 'package:flutter/material.dart';
// import 'package:isimm_app2/domain/module.dart';
// import 'package:isimm_app2/presentation/chaptre/widgets/chaptrecard.dart';
// import 'package:isimm_app2/presentation/chaptre/widgets/modulewigdet.dart';

// import '../../resources/routes_manager.dart';

// class Chapter extends StatefulWidget {
//   final bool type;
//   Chapter({Key? key, required String id, required this.type}) : super(key: key);
//   String? id;

//   @override
//   State<Chapter> createState() => _ChapterState(type, id);
// }

// class _ChapterState extends State<Chapter> {
//   final bool type;
//   static const primaryColor = Color(0xFF007AFF);
//   static const c2 = Color(0xFF3282B8);
//   static const c3 = Color(0xB20F4C75);
//   String? id;
//   _ChapterState(this.type, this.id);
//   final List<Module> mList = [
//     Module("Module 1"),
//     Module("Module 1"),
//     Module("Module 1"),
//     Module("Module 1"),
//     Module("Module 1"),
//     Module("Module 1"),
//     Module("Module 1"),
//     Module("Module 1"),
//     Module("Module 1"),
//     Module("Module 1"),
//   ];
//   final chList = [
//     const ChapterCard("Chapter 1", null),
//     const ChapterCard("Chapter 2", null),
//     const ChapterCard("Chapter 3", null),
//     const ChapterCard("Chapter 4", null),
//     const ChapterCard("Chapter 5", null),
//     const ChapterCard("Chapter 6", null),
//     const ChapterCard("Chapter 7", null),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         //toolbarHeight: 90.0,
//         title: Container(
//           color: Color.fromARGB(255, 255, 255, 255),
//           height: 90,
//           //width: 140,
//           child: Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, Routes.HomeRoute);
//                 },
//                 icon: Icon(Icons.arrow_back),
//               ),
//               Container(
//                 height: 45,
//                 width: 45,
//                 child: Image.asset(
//                   "assets/images/raslogo.png",
//                 ),
//               ),
//               SizedBox(
//                 width: 6,
//               ),
//               Text(
//                 "ISIMM",
//                 style: TextStyle(
//                     //fontFamily: "RobotoSlab-VariableFont_wght",
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold),
//               )
//               // Container(
//               //   height: 60,
//               //   width: 60,
//               //   child: Image.asset(
//               //     "assets/images/isimmlogo.png",
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//         actions: [
//           /*IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active)),
//         SizedBox(
//           width: 10,
//         ),
//         CircleAvatar(
//           child: Icon(Icons.person),
//         ),*/
//         ],
//       ),
//       body: Container(
//         //height: 500,
//         margin: const EdgeInsets.only(top: 20),
//         decoration: BoxDecoration(
//             color: primaryColor, borderRadius: BorderRadius.circular(20)),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.fromLTRB(30, 30, 0, 20),
//               child: Text(
//                 "ING1_INFO",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//             SizedBox(
//               height: 0,
//               child: Expanded(
//                 child: ListView.builder(
//                   // ListView.separated(
//                   //   separatorBuilder: (context, idx) => const Divider(),
//                   itemBuilder: (context, idx) {
//                     return ModuleWidget(mList[idx]);
//                   },
//                   scrollDirection: Axis.horizontal,
//                   itemCount: mList.length,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(top: 20),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 40, vertical: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Matiere",
//                                 style: TextStyle(
//                                     color: Colors.black.withOpacity(0.7),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w700)),
//                             GestureDetector(
//                               onTap: () {
//                                 // type
//                                 //     ? null
//                                 //     // ? Navigator.push(
//                                 //     //     context,
//                                 //     //     MaterialPageRoute(
//                                 //     //         builder: (context) =>
//                                 //     //             const fillChapter()))
//                                 //     : Navigator.push(
//                                 //         context,
//                                 //         MaterialPageRoute(
//                                 //             builder: (context) => Marks(
//                                 //                 MarksModelView(
//                                 //                     studentId: "2"))));
//                               },
//                               child: Container(
//                                 height: 26,
//                                 width: 106,
//                                 decoration: BoxDecoration(
//                                     color: primaryColor,
//                                     borderRadius: BorderRadius.circular(10),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         color: Color(0x3282B833),
//                                         blurRadius: 8,
//                                         spreadRadius: 3,
//                                         offset: Offset(
//                                             0, 4), // changes position of shadow
//                                       ),
//                                     ]),
//                                 child: Center(
//                                   child: Text(
//                                       type ? "ADD CHAPTER" : "CONSULT MARKS",
//                                       style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: ListView.builder(
//                           // ListView.separated(
//                           //   separatorBuilder: (context, idx) => const Divider(),
//                           itemBuilder: (context, idx) {
//                             return chList[idx];
//                           },
//                           scrollDirection: Axis.vertical,
//                           itemCount: chList.length,
//                         ),
//                       ),
//                     ]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
