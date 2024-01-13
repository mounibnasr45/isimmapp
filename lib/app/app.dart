import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/routes_manager.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.teachernews,
      theme: ThemeData(useMaterial3: true).copyWith(
          textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: Colors.black,
            // fontFamily: 'Oswald',
            fontWeight: FontWeight.w700,
            fontSize: 16),
        bodyMedium: TextStyle(
            color: Colors.black,
            // fontFamily: 'Oswald',
            fontWeight: FontWeight.w300,
            fontSize: 14),
        bodySmall: TextStyle(
            color: Colors.black,
            //fontFamily: 'Oswald',
            fontWeight: FontWeight.w300,
            fontSize: 10),
        titleLarge: TextStyle(
            color: Color.fromARGB(255, 11, 104, 118),
            // fontFamily: 'Oswald',
            fontWeight: FontWeight.bold,
            fontSize: 20),
      )),
    );
  }
}
