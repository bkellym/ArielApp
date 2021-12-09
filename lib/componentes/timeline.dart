// ignore_for_file: camel_case_types, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ariel_app/controladores/timeline_controller.dart';

class Timeline extends StatelessWidget {
  TimelineController controller = TimelineController();

  Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> lista = controller.getListaTimeline();

    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, indice) {
        return lista[indice];
      },
    );
  }
}
