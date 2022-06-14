import 'package:ariel_app/models/evento_model.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../components/divisoria.dart';
import '../components/evento.dart';
import '../texto.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ArielColors.baseLight,
      ),
      child: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xFF1CE8B4),
                  Color(0xFF1CC2EB),
                ],
              ),
            ),
            child: SizedBox(
              height: 110,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ArielColors.baseLight,
                              width: 3.0,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                'assets/images/foto.jpg',
                              ).image,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texto.bold(
                          data: "Keller",
                          size: 18,
                          color: ArielColors.baseLight,
                        ),
                        Texto.semiBold(
                          data: "Visto em 6 de junho de 2022",
                          size: 9,
                          color: ArielColors.baseLight,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      bottom: 18,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Texto.semiBold(
                                data: "08",
                                size: 34,
                                color: ArielColors.baseLight,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Texto.bold(
                                  data: "JUNHO",
                                  size: 19,
                                  color: ArielColors.baseLight,
                                ),
                                Texto.semiBold(
                                  data: "QUARTA | 2022",
                                  size: 9,
                                  color: ArielColors.baseLight,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Evento(
            evento: EventoModel(
                titulo: "Próximo Exame",
                tipo: "Exame de Sangue",
                data: DateTime.utc(2022, 07, 9),
                descricao:
                    "Dosagem de T3, dosagem de T4, creatinina, uréia, hemograma completo",
                cor: 0xFFFF6D7C),
          ),
          Evento(
            evento: EventoModel(
                titulo: "Próxima Consulta",
                tipo: "Endocrinologista",
                data: DateTime.utc(2022, 07, 10),
                descricao: "Dr. Alberto de Sá, Clínica Dionísio Torres",
                cor: 0xFF1DCBE0),
          ),
        ],
      ),
    );
  }
}
