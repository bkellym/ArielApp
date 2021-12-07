// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ariel_app/telas/Template.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var now = DateTime.parse("2021-12-30 20:18:04Z");

    return const TemplateApp(
      tela: Text("Tela 2: Calendário"),
    );
  }
}
