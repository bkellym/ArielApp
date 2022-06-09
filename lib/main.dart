import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:ariel_app/screens/introducao.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ArielApp());
}

class ArielApp extends StatelessWidget {
  const ArielApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ariel',
      home: const Introducao(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
