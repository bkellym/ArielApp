// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ariel_app/componentes/card_claro.dart';
import 'package:ariel_app/componentes/card_escuro.dart';
import 'package:ariel_app/componentes/card_data_atual.dart';
import 'package:ariel_app/telas/Template.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var now = DateTime.parse("2021-12-30 20:18:04Z");

    return TemplateApp(
      tela: ListView(
        children: <Widget>[
          Container(
              height: 280,
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
              )),
          const CardClaro(
            titulo: "Como foi o seu dia?",
            descricao:
                'Registre seus parâmetros diariamente para gerar gráficos mais precisos.',
            iconeReferencia: Icons.calendar_today,
          ),
          const CardEscuro(
            titulo: "Aplicação de Testosterona",
            descricao:
                'Você definiu essa data, mas pode mudá-la quando desejar.',
            iconeReferencia: Icons.date_range,
          ),
        ],
      ),
    );
  }
}
