import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:ariel_app/screens/autenticacao/auth_cadastro.dart';
import 'package:ariel_app/screens/autenticacao/auth_login.dart';
import 'package:ariel_app/screens/cadastro_completo.dart';
import 'package:ariel_app/screens/introducao.dart';
import 'package:ariel_app/ariel_app_routes.dart';
import 'package:ariel_app/screens/inicio.dart';

final Locale myLocale = new Locale("pt", "BR");

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
      routes: ArielAppRoutes.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [myLocale],
      debugShowCheckedModeBanner: false,
    );
  }
}
