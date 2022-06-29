import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:ariel_app/components/menus/menu_navegation.dart';
import 'package:ariel_app/components/grafico_principal.dart';
import 'package:ariel_app/components/data_atual.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/components/destaque.dart';
import 'package:ariel_app/models/evento_model.dart';
import 'package:ariel_app/components/evento.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/texto.dart';

class Inicio extends StatelessWidget {
  Inicio({Key? key}) : super(key: key);

  final List<double> chartData = [1, 1, 0, 0, 0, 0];
  final user = FirebaseAuth.instance.currentUser;
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
              height: SizeConfig.of(context).dynamicScaleSize(size: 100),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              image: Image.network(
                                user?.photoURL! ?? "",
                              ).image,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texto(
                          user?.displayName ?? "",
                          size: 18,
                          color: ArielColors.baseLight,
                          fontWeight: Weight.bold,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  DataAtual(),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GraficoPrincipal(
                hormonio: "Deposteron 2mg",
                proxAplicacao: DateTime.parse("2022-07-11"),
                chartData: chartData,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Destaque(
                      titulo: "Fase do Ciclo",
                      valor: "2ª aplicação de 6",
                    ),
                    Destaque(
                      titulo: "Próxima aplicação",
                      valor: DateFormat("dd/MM/y", "pt_BR")
                          .format(DateTime.parse("2022-07-11")),
                    ),
                    Destaque(
                      titulo: "Ultima aplicação",
                      valor: DateFormat("dd/MM/y", "pt_BR")
                          .format(DateTime.parse("2022-06-20")),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
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
          MenuNavegacao(1)
        ],
      ),
    );
  }
}
