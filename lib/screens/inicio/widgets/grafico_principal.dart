import 'package:ariel_app/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoPrincipal extends StatelessWidget {
  final DateTime now = DateTime.now();
  final List<double> chartData;
  final DateTime proxAplicacao;
  final String hormonio;
  final String dosagem;
  late final int daysRemaining;

  GraficoPrincipal({
    Key? key,
    required this.proxAplicacao,
    required this.chartData,
    required this.hormonio,
    required this.dosagem,
  }) : super(key: key) {
    daysRemaining = proxAplicacao.difference(now).inDays + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.50,
        width: MediaQuery.of(context).size.width * 0.50,
        child: SfCircularChart(
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
                widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  hormonio.toUpperCase(),
                  style: const TextStyle(
                    color: ArielColors.textLight,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    dosagem.toLowerCase(),
                    style: const TextStyle(
                      color: ArielColors.textLight,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                Text(
                  (daysRemaining > 1 ? 'Faltam' : 'Falta').toUpperCase(),
                  style: const TextStyle(
                    color: ArielColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    '$daysRemaining ${daysRemaining > 1 ? 'dias' : 'dia'}'
                        .toUpperCase(),
                    style: const TextStyle(
                      color: ArielColors.textPrimary,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Para a próxima\naplicação'.toUpperCase(),
                  style: const TextStyle(
                    color: ArielColors.textPrimary,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
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
                  : ArielColors.disable,
            ),
          ],
        ),
      ),
    );
  }
}
