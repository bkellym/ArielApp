// ignore_for_file: camel_case_types, file_names

import 'package:ariel_app/models/item_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ariel_app/componentes/card_lembrete.dart';
import 'package:ariel_app/componentes/card_timeline.dart';

class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CardLembrete(
          titulo: "Como foi o seu dia?",
          descricao:
              'Registre seus parâmetros diariamente para gerar gráficos mais precisos.',
          iconeReferencia: Icons.calendar_today,
        ),
        CardTimeline(
          item: ItemTimeline(
              titulo: "Exame de Sangue",
              descricao: "Ver mais informações",
              data: DateTime.parse("2021-12-29")),
        ),
        CardTimeline(
          item: ItemTimeline(
              titulo: "Aplicação de Testosterona",
              descricao:
                  "Você definiu essa data, mas pode mudá-la quando desejar.",
              data: DateTime.parse("2022-01-02"),
              dark: true,
              alto: true),
        ),
        const Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        ),
        Column(
          children: const [
            Text(
              "Isso é tudo!",
              style: TextStyle(
                color: Color(0xFF1B569C),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                "Esses são seus eventos principais, para ver mais acesse o seu calendário na barra inferior",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1B569C),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
