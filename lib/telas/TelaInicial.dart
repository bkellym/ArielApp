// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ariel_app/componentes/card_data_atual.dart';
import 'package:ariel_app/componentes/timeline.dart';
import 'package:ariel_app/telas/Template.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 0;

    return TemplateApp(
      menu_index: index,
      tela: Column(
        children: <Widget>[
          Container(
            height: 280,
            margin: const EdgeInsets.only(top: 8),
            alignment: Alignment.topLeft,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF64A9F7),
                    Color(0xFFC6E1FF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [1, 2]),
            ),
            child: Row(
              children: const <Widget>[
                CardDataAtual(),
              ],
            ),
          ),
          const Expanded(
            child: Timeline(),
          )
        ],
      ),
    );
  }
}
