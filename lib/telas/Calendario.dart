// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ariel_app/telas/Template.dart';

class Calendario extends StatelessWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 1;

    return TemplateApp(
      menu_index: index,
      tela: const Text("Tela 2: Calendário"),
    );
  }
}
