import 'package:ariel_app/models/event.dart';
import 'package:flutter/cupertino.dart';

import 'package:ariel_app/components/cards/card_timeline.dart';

List<Event> listaEventos = [
  Event(
    titulo: "Aplicação de Testosterona",
    descricao: "Você definiu essa data, mas pode mudá-la quando desejar.",
    data: DateTime.parse("2022-01-02"),
    dark: true,
    alto: true,
  ),
  Event(
    titulo: "Aplicação de Testosterona",
    descricao: "Você definiu essa data, mas pode mudá-la quando desejar.",
    data: DateTime.parse("2022-01-02"),
    dark: true,
    alto: true,
  ),
  Event(
    titulo: "Aplicação de Testosterona",
    descricao: "Você definiu essa data, mas pode mudá-la quando desejar.",
    data: DateTime.parse("2022-01-02"),
    dark: true,
    alto: true,
  ),
  Event(
    titulo: "Aplicação de Testosterona",
    descricao: "Você definiu essa data, mas pode mudá-la quando desejar.",
    data: DateTime.parse("2022-01-02"),
    dark: true,
    alto: true,
  ),
];


class TimelineController {

  static List<Widget> getTimeline(){
    List<Widget> lista = [];

    for (var index = 0; index < listaEventos.length; index) {
      lista.add(CardTimeline(item: listaEventos[index]));
    }

    return lista;
  }

}