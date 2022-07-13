import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/firebase_options.dart';

import 'package:ariel_app/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}
