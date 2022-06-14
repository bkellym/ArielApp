import 'package:flutter/material.dart';

import 'package:ariel_app/screens/autenticacao/auth_cadastro.dart';
import 'package:ariel_app/screens/autenticacao/auth_login.dart';
import 'package:ariel_app/screens/introducao.dart';
import 'package:ariel_app/screens/inicio.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Introducao(),
        '/login': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
        '/inicio': (context) => Inicio(),
      },
    );
  }
}
