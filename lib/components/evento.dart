import 'package:ariel_app/components/botoes/botao_sec_contorno.dart';
import 'package:ariel_app/models/evento_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/divisoria.dart';
import '../core/util/texto.dart';
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
            child: Texto(
              evento.titulo.toUpperCase(),
              size: 11,
              color: Color(evento.cor),
              fontWeight: Weight.bold,
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
                              Texto(
                                "Tipo",
                                size: 9,
                                color: Color(evento.cor),
                                fontWeight: Weight.bold,
                              ),
                              Texto(
                                evento.tipo,
                                size: 9,
                                fontWeight: Weight.bold,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texto(
                                "Data",
                                size: 9,
                                color: Color(evento.cor),
                                fontWeight: Weight.bold,
                              ),
                              Texto(
                                DateFormat("'|' dd/MM/yyyy")
                                    .format(evento.data)
                                    .toString(),
                                size: 9,
                                fontWeight: Weight.bold,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texto(
                                "Horário",
                                size: 9,
                                color: Color(evento.cor),
                                fontWeight: Weight.bold,
                              ),
                              Texto(
                                "| 08:00h",
                                size: 9,
                                fontWeight: Weight.bold,
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
                      child: Texto(
                        evento.descricao,
                        size: 9,
                        fontWeight: Weight.regular,
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
