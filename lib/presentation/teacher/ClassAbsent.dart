import 'package:flutter/material.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/studentBD.dart';
import '../resources/routes_manager.dart';

class ClassAbsent extends StatefulWidget {
  const ClassAbsent({super.key});

  @override
  State<ClassAbsent> createState() => _ClassAbsentState();
}

class _ClassAbsentState extends State<ClassAbsent> {
  // ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarprofile(),
      body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text("A Screen meant for professors !"),
          Row(
            children: [
              Container(
                  height: 70,
                  width: 70,
                  child: Image.asset("assets/images/professorlogo.webp")),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Professor: SALAH BEN YOUSSEF"),
                  Text("TD: ING1_INFO"),
                ],
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          StudentTable(),
          SizedBox(
            height: 500,
          ),
          Image.asset("assets/images/ministere.jpg"),
        ],
      ),
    ),
    );
  }
}

// class StudentTable extends StatefulWidget {
//   const StudentTable({super.key});

//   @override
//   State<StudentTable> createState() => _StudentTableState();
// }

// class _StudentTableState extends State<StudentTable>
//     with AutomaticKeepAliveClientMixin {
//   List<Map<String, dynamic>> students = [
//     {
//       'name': "m1",
//       'note': 0,
//       'abs1': false,
//       'abs2': false,
//       'abs3': false,
//       'abs4': false,
//     },
//     {
//       'name': "m2",
//       'note': 0,
//       'abs1': false,
//       'abs2': false,
//       'abs3': false,
//       'abs4': false,
//     },
//     {
//       'name': "m3",
//       'note': 0,
//       'abs1': false,
//       'abs2': false,
//       'abs3': false,
//       'abs4': false,
//     },
//     {
//       'name': "m4",
//       'note': 0,
//       'abs1': false,
//       'abs2': false,
//       'abs3': false,
//       'abs4': false,
//     },
//     {
//       'name': "m5",
//       'note': 0,
//       'abs1': false,
//       'abs2': false,
//       'abs3': false,
//       'abs4': false,
//     },
//     {
//       'name': "m6",
//       'note': 0,
//       'abs1': false,
//       'abs2': false,
//       'abs3': false,
//       'abs4': false,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//           columns: [
//             DataColumn(label: Text('Student')),
//             DataColumn(label: Text('Marks')),
//             DataColumn(label: Text('01 janv 2023')),
//             DataColumn(label: Text('02 janv 2023')),
//             DataColumn(label: Text('03 janv 2023')),
//             DataColumn(label: Text('04 janv 2023')),
//           ],
//           rows: students
//               .map((e) => DataRow(
//                     cells: [
//                       DataCell(Text(e['name'])), // Nom de l'étudiant
//                       DataCell(
//                           Text(e['note'].toString())), // Note de l'étudiant
//                       DataCell(
//                         Checkbox(
//                           value: e['abs1'],
//                           onChanged: (bool? value) {
//                             setState(() {
//                               if (value != null) {
//                                 e['abs1'] = value;
//                               }
//                             });
//                           },
//                         ), // Case à cocher 1
//                       ),
//                       DataCell(
//                         Checkbox(
//                           value: e['abs2'],
//                           onChanged: (bool? value) {
//                             setState(() {
//                               if (value != null) {
//                                 e['abs2'] = value;
//                               }
//                             });
//                           },
//                         ), // Case à cocher 2
//                       ),
//                       DataCell(
//                         Checkbox(
//                           value: e['abs3'],
//                           onChanged: (bool? value) {
//                             setState(() {
//                               if (value != null) {
//                                 e['abs3'] = value;
//                               }
//                             });
//                           },
//                         ), // Case à cocher 3
//                       ),
//                       DataCell(
//                         Checkbox(
//                           value: e['abs4'],
//                           onChanged: (value) {
//                             setState(() {
//                               if (value != null) {
//                                 e['abs4'] = value;
//                               }
//                             });
//                           },
//                         ), // Case à cocher 4
//                       ),
//                     ],
//                   ))
//               .toList(),
//         ),
//       ),
//     );
//   }

//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
// }
/******************************
 * ****************************
 * *****************************
 */
/*import 'package:flutter/material.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

class StudentTable extends StatefulWidget {
  const StudentTable({Key? key}) : super(key: key);

  @override
  State<StudentTable> createState() => _StudentTableState();
}

class _StudentTableState extends State<StudentTable>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;

  List<Map<String, dynamic>> students = [
    // Your student data here
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            // Handle scroll update
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Stack(
            children: [
              DataTable(
                columns: [
                  DataColumn(label: Text('Nom')),
                  DataColumn(label: Text('Note')),
                  DataColumn(label: Text('01/01/2023')),
                  DataColumn(label: Text('02/01/2023')),
                  DataColumn(label: Text('03/01/2023')),
                  DataColumn(label: Text('04/01/2023')),
                ],
                rows: students
                    .map((e) => DataRow(
                          cells: [
                            DataCell(Text(e['name'])), // Nom de l'étudiant
                            DataCell(Text(
                                e['note'].toString())), // Note de l'étudiant
                            DataCell(
                              Checkbox(
                                value: e['abs1'],
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value != null) {
                                      e['abs1'] = value;
                                    }
                                  });
                                },
                              ), // Case à cocher 1
                            ),
                            DataCell(
                              Checkbox(
                                value: e['abs2'],
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value != null) {
                                      e['abs2'] = value;
                                    }
                                  });
                                },
                              ), // Case à cocher 2
                            ),
                            DataCell(
                              Checkbox(
                                value: e['abs3'],
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value != null) {
                                      e['abs3'] = value;
                                    }
                                  });
                                },
                              ), // Case à cocher 3
                            ),
                            DataCell(
                              Checkbox(
                                value: e['abs4'],
                                onChanged: (value) {
                                  setState(() {
                                    if (value != null) {
                                      e['abs4'] = value;
                                    }
                                  });
                                },
                              ), // Case à cocher 4
                            ),
                          ],
                        ))
                    .toList(),
              ),
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: ScrollIndicator(
                  scrollController: _scrollController,
                  width: 20,
                  height: 5,
                  indicatorWidth: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300],
                  ),
                  indicatorDecoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}*/
/****************
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */
class MyAppBarprofile extends StatelessWidget implements PreferredSizeWidget {
  MyAppBarprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pushReplacementNamed(context, Routes.schedule_teach),
      ),
      automaticallyImplyLeading: false,
      title: Text("presence sheet"),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class StudentTable extends StatefulWidget {
  const StudentTable({Key? key}) : super(key: key);

  @override
  State<StudentTable> createState() => _StudentTableState();
}

class _StudentTableState extends State<StudentTable>
    with AutomaticKeepAliveClientMixin {
  late Box<Student> studentsBox;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future<void> openBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter(StudentAdapter());
    studentsBox = await Hive.openBox<Student>('students');

    // Add a Future.delayed to simulate an asynchronous operation
    await Future.delayed(Duration(milliseconds: 1000));
    for (int i = 1; i <= 10; i++) {
      studentsBox?.add(Student(
        id: i,
        nom: 'Student $i',
        note: 0,
        abs: false, // Changer la valeur d'abs à false
        nbAbsent: 0,
      ));
    }
    setState(() {
      // Trigger a rebuild after the box is initialized
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder(
      // Replace Future.delayed with the actual asynchronous operation to open the Hive box
      future: Future.delayed(Duration(milliseconds: 200), () => openBox()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // The Hive box is now fully initialized, you can access studentsBox
          return Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ValueListenableBuilder(
                valueListenable: studentsBox.listenable(),
                builder: (context, Box<Student> box, _) {
                  return DataTable(
                    columns: [
                      DataColumn(
                        label: Container(
                          color: Colors
                              .blue, // Set the background color for the first column
                          child: Text('Student Name'),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          color: Colors.blue,
                          child: Text(
                            'Marks',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          color: Colors
                              .blue, // Set the background color for the first column
                          child: Text('Present'),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          color: Colors
                              .blue, // Set the background color for the first column
                          child: Text('Nb Absent'),
                        ),
                      ),
                    ],
                    rows: box.values
                        .map((e) => DataRow(
                              cells: [
                                DataCell(Text(
                                  e.nom,
                                  style: TextStyle(color: Colors.black),
                                )), // Nom de l'étudiant
                                DataCell(Text(
                                  e.note.toString(),
                                  style: TextStyle(color: Colors.black),
                                )), // Note de l'étudiant
                                DataCell(
                                  Checkbox(
                                    value: e.abs,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value != null) {
                                          e.abs = value;
                                          e.save(); // Sauvegarder les modifications dans la base de données
                                        }
                                      });
                                    },
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    e.nbAbsent.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ), // Nombre d'absences de l'étudiant
                                ),
                              ],
                            ))
                        .toList(),
                  );
                },
              ),
            ),
          );
        } else {
          // Return a loading indicator or an empty widget while initialization is in progress
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
