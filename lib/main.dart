import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:isimm_app2/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    DevicePreview(enabled: true, builder: (context) => MyApp()),
  );
}
