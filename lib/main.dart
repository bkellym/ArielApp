import 'package:flutter/material.dart';

import 'package:ariel_app/screens/homepage.dart';

void main() {
  runApp(const ArielApp());
}

class ArielApp extends StatelessWidget {
  const ArielApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ariel',
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


