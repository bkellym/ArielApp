import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ariel_app/models/user_model.dart';
import 'package:ariel_app/controller/user_info_controller.dart';
import 'package:ariel_app/screens/ciclo/ciclo_page.dart';
import 'package:ariel_app/screens/exames_consultas/exames_consultas_page.dart';
import 'package:ariel_app/screens/inicio/inicio_page.dart';
import 'package:ariel_app/screens/perfil/perfil_page.dart';

class ArielBloc extends BlocBase {
  UserModel? user;
  int selectedIndex = 0;
  List<Widget> widgetOptions = [];

  UserInfoController userController =
      UserInfoController(FirebaseAuth.instance.currentUser);

  buscarDadosUsuario(int? tela) async {
    selectedIndex = tela ?? selectedIndex;
    user = await userController.buscar().then((value) {
      widgetOptions = <Widget>[
        InicioPage(user: value!),
        CicloPage(user: value),
        ExamesConsultasPage(),
        PerfilPage(),
      ];

      return value;
    });
  }
}
