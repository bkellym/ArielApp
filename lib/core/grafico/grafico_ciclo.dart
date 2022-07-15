import 'package:ariel_app/core/grafico/status/atrasado.dart';
import 'package:ariel_app/core/grafico/status/completo.dart';
import 'package:ariel_app/core/grafico/status/hoje.dart';
import 'package:ariel_app/core/grafico/status/proximo.dart';
import 'package:ariel_app/core/models/aplicacao_model.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoCiclo extends StatelessWidget {
  final CicloModel? ciclo;
  final List<double> chartData;
  final Function? onPressed;
  final double size;
  late final int daysRemaining;

  GraficoCiclo({
    Key? key,
    required this.chartData,
    required this.size,
    this.onPressed,
    required this.ciclo,
  }) : super(key: key);

  Widget getStatusAplicacao() {
    List<AplicacaoModel>? filtrado =
        ciclo?.aplicacoes.where((element) => element.feito == false).toList();

    if (filtrado == null || filtrado.isEmpty) {
      return StatusCompleto(fontSize: size * 0.1);
    }

    DateTime? prox = filtrado.first.data;
    int dias = prox
        .difference(DateFormat('yyyy-MM-dd').parse(DateTime.now().toString()))
        .inDays;

    if (dias < 0) {
      return StatusAtrasado(fontSize: size * 0.12);
    } else if (dias == 0) {
      return StatusHoje(fontSize: size * 0.1);
    } else {
      return StatusProximo(dias: dias, fontSize: size * 0.13);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: SizedBox(
        height: size,
        width: size,
        child: SfCircularChart(
          onChartTouchInteractionUp: (ChartTouchInteractionArgs args) {
            try {
              onPressed!();
              print("pressionou");
            } catch (e) {
              print(e.toString());
            }
          },
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(widget: getStatusAplicacao())
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
    );
  }
}
