import 'package:ariel_app/screens/ariel_app.dart';
import 'package:ariel_app/screens/cadastro_completo.dart';
import 'package:ariel_app/src/autenticacao/auth_cadastro.dart';
import 'package:ariel_app/src/autenticacao/auth_login.dart';
import 'package:ariel_app/src/autenticacao/introducao.dart';
import 'package:flutter/widgets.dart';

class ArielAppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const Introducao(),
    '/login': (context) => const Login(),
    '/cadastro': (context) => const Cadastro(),
    '/inicio': (context) => const App(),
    '/CadastroCompleto': (context) => CadastroCompleto()
  };
}