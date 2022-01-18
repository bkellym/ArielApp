import 'package:flutter/material.dart';

import 'package:ariel_app/controller/timeline_controller.dart';

class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> lista = TimelineController.getTimeline();

    return Expanded(
      child: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, indice) {
          return lista[indice];
        },
      ),
    );
  }
}
