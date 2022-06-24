import 'package:flutter/widgets.dart';

import 'package:ariel_app/screens/autenticacao/auth_cadastro.dart';
import 'package:ariel_app/screens/autenticacao/auth_login.dart';
import 'package:ariel_app/screens/introducao.dart';
import 'package:ariel_app/screens/inicio.dart';

class ArielAppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const Introducao(),
    '/login': (context) => const Login(),
    '/cadastro': (context) => const Cadastro(),
    '/inicio': (context) => Inicio(),
  };
}
