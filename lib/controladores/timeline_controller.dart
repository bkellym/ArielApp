import 'package:ariel_app/componentes/card_lembrete.dart';
import 'package:ariel_app/componentes/card_timeline.dart';
import 'package:ariel_app/componentes/divisoria.dart';
import 'package:ariel_app/componentes/timeline_end.dart';
import 'package:ariel_app/models/evento.dart';
import 'package:flutter/material.dart';

class TimelineController {
  final CardLembrete _registroDia = const CardLembrete(
    titulo: "Como foi o seu dia?",
    descricao:
        'Registre seus parâmetros diariamente para gerar gráficos mais precisos.',
    iconeReferencia: Icons.calendar_today,
  );

  final List<Evento> _listaEventos = [
    Evento(
      titulo: "Exame de Sangue",
      descricao: "Ver mais informações",
      data: DateTime.parse("2021-12-29"),
    ),
    Evento(
      titulo: "Aplicação de Testosterona",
      descricao: "Você definiu essa data, mas pode mudá-la quando desejar.",
      data: DateTime.parse("2022-01-02"),
      dark: true,
      alto: true,
    ),
    Evento(
      titulo: "Exame de Sangue",
      descricao: "Ver mais informações",
      data: DateTime.parse("2021-12-29"),
    ),
    Evento(
      titulo: "Aplicação de Testosterona",
      descricao: "Você definiu essa data, mas pode mudá-la quando desejar.",
      data: DateTime.parse("2022-01-02"),
      dark: true,
      alto: true,
    ),
    Evento(
      titulo: "Exame de Sangue",
      descricao: "Ver mais informações",
      data: DateTime.parse("2021-12-29"),
    ),
    Evento(
      titulo: "Aplicação de Testosterona",
      descricao: "Você definiu essa data, mas pode mudá-la quando desejar.",
      data: DateTime.parse("2022-01-02"),
      dark: true,
      alto: true,
    )
  ];

  List<Widget> getListaTimeline() {
    List<Widget> lista = [];
    lista.add(_registroDia);

    for (var index = 0; index < _listaEventos.length; index + 1) {
      lista.add(CardTimeline(item: _listaEventos[index]));
    }

    lista.add(const Divisoria());
    lista.add(const TimelineEnd());

    return lista;
  }
}
