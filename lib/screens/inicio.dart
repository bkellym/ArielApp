import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

import 'package:ariel_app/models/evento_model.dart';
import 'package:ariel_app/colors.dart';
import 'package:ariel_app/components/divisoria.dart';
import 'package:ariel_app/components/evento.dart';
import 'package:ariel_app/texto.dart';

class Inicio extends StatelessWidget {
  Inicio({Key? key}) : super(key: key);

  final List<double> chartData = [1, 0, 0, 0, 0, 0];

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                child: SfCircularChart(
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                        widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: Text(
                            'Deposteron\n2mg',
                            style: TextStyle(
                              color: ArielColors.textPrimary,
                              fontSize: 8,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: Text(
                            'Faltam\n10 dias',
                            style: TextStyle(
                              color: ArielColors.textPrimary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'Para a próxima\naplicação',
                          style: TextStyle(
                            color: ArielColors.textPrimary,
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))
                  ],
                  series: <CircularSeries>[
                    DoughnutSeries<double, String>(
                      radius: '100%',
                      innerRadius: '85%',
                      strokeWidth: 3,
                      strokeColor: Colors.white,
                      dataSource: chartData,
                      xValueMapper: (double data, _) => data.toString(),
                      yValueMapper: (double data, _) => 1,
                      pointColorMapper: (double data, _) => data > 0
                          ? ArielColors.arielGreen
                          : ArielColors.disabledGradientLight,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Fase do Ciclo",
                      style: TextStyle(
                        fontSize: 11,
                        color: ArielColors.arielGreen,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: const [
                          Text(
                            "| ",
                            style: TextStyle(
                              fontSize: 16,
                              color: ArielColors.arielGreen,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "1ª Aplicação de 6",
                            style: TextStyle(
                              fontSize: 12,
                              color: ArielColors.textPrimary,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Próxima aplicação",
                        style: TextStyle(
                          fontSize: 11,
                          color: ArielColors.arielGreen,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: const [
                          Text(
                            "| ",
                            style: TextStyle(
                              fontSize: 16,
                              color: ArielColors.arielGreen,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "20/06/2022",
                            style: TextStyle(
                              fontSize: 12,
                              color: ArielColors.textPrimary,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Ultima aplicação",
                        style: TextStyle(
                          fontSize: 11,
                          color: ArielColors.arielGreen,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Row(
                        children: const [
                          Text(
                            "| ",
                            style: TextStyle(
                              fontSize: 16,
                              color: ArielColors.arielGreen,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "04/06/2022",
                            style: TextStyle(
                              fontSize: 12,
                              color: ArielColors.textPrimary,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
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
        ],
      ),
    );
  }
}
