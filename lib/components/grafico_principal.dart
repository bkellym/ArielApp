import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:ariel_app/colors.dart';

class GraficoPrincipal extends StatelessWidget {
  final DateTime now = DateTime.now();
  final List<double> chartData;
  final DateTime proxAplicacao;
  final String hormonio;
  late final int daysRemaining;

  GraficoPrincipal({
    Key? key,
    required this.proxAplicacao,
    required this.chartData,
    required this.hormonio,
  }) : super(key: key) {
    daysRemaining = proxAplicacao.difference(now).inDays + 1;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      child: SfCircularChart(
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
              widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Text(
                  hormonio,
                  style: const TextStyle(
                    color: ArielColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Text(
                  '${daysRemaining > 1 ? 'Faltam' : 'Falta'}\n$daysRemaining ${daysRemaining > 1 ? 'dias' : 'dia'}',
                  style: const TextStyle(
                    color: ArielColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Text(
                'Para a próxima\naplicação',
                style: TextStyle(
                  color: ArielColors.textPrimary,
                  fontSize: 11,
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
    );
  }
}
