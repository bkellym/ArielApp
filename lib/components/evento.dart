import 'package:ariel_app/components/botoes/botao_sec_contorno.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:ariel_app/models/evento_model.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../components/divisoria.dart';
import '../texto.dart';
import 'botoes/botao_sec_preenchido.dart';

class Evento extends StatelessWidget {
  final EventoModel evento;

  const Evento({
    Key? key,
    required this.evento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Texto.bold(
              data: evento.titulo.toUpperCase(),
              size: 11,
              color: Color(evento.cor),
            ),
          ),
          Divisoria(cor: Color(evento.cor)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 13,
                          color: Color(evento.cor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texto.bold(
                                data: "Tipo",
                                size: 9,
                                color: Color(evento.cor),
                              ),
                              Texto.bold(
                                data: evento.tipo,
                                size: 9,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texto.bold(
                                data: "Data",
                                size: 9,
                                color: Color(evento.cor),
                              ),
                              Texto.bold(
                                data: DateFormat("'|' dd/MM/yyyy")
                                    .format(evento.data)
                                    .toString(),
                                size: 9,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texto.bold(
                                data: "Horário",
                                size: 9,
                                color: Color(evento.cor),
                              ),
                              Texto.bold(
                                data: "| 08:00h",
                                size: 9,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      color: Color(evento.cor - 0xDD000000),
                      padding: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 0.58,
                      child: Texto.regular(
                        data: evento.descricao,
                        size: 9,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BtSecPreenchido(
                      label: "Detalhes",
                      onPressed: () {},
                      color: Color(
                        evento.cor,
                      ),
                      fontSize: 9,
                      internalPadding: 9,
                    ),
                    BtSecContorno(
                      label: "Detalhes",
                      onPressed: () {},
                      color: Color(
                        evento.cor,
                      ),
                      fontSize: 9,
                      internalPadding: 9,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
