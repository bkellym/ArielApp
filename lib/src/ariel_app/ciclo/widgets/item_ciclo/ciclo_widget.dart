import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/shared/detalhe/campo_destaque.dart';
import 'package:ariel_app/core/shared/detalhe/campo_detalhe.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/detalhes_ciclo/detalhe_ciclo_widget.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/registroAplicacao/registro_aplicacao_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CicloWidget extends StatefulWidget {
  final CicloModel model;

  const CicloWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<CicloWidget> createState() => _CicloWidgetState();
}

class _CicloWidgetState extends State<CicloWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.of(context).dynamicScaleSize(size: 8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const VerticalDivider(width: 8),
                CampoDestaque(
                  titulo: "MEDICAMENTO",
                  valor: widget.model.medicamento,
                  color: ArielColors.cicloColor,
                  asIcon: true,
                ),
                CampoDetalhe(
                  titulo: "INÍCIO DO TRATAMENTO",
                  valor: DateFormat("dd/MM/yyyy")
                      .format(DateTime.parse(widget.model.dataIncio)),
                  color: ArielColors.cicloColor,
                  lineColor: ArielColors.cicloColor,
                  padding: EdgeInsets.only(
                    top: SizeConfig.of(context).dynamicScaleSize(size: 0),
                    left: SizeConfig.of(context).dynamicScaleSize(size: 32),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.of(context).dynamicScaleSize(size: 85),
                  width: SizeConfig.of(context).dynamicScaleSize(size: 100),
                  child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Texto(
                              widget.model.statusAplicacoes
                                  .where((element) => element == 1)
                                  .length
                                  .toString(),
                              fontWeight: Weight.bold,
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 20),
                            ),
                            Texto(
                              "/${widget.model.statusAplicacoes.length}",
                              color: ArielColors.cicloColor,
                              fontWeight: Weight.bold,
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                    series: <CircularSeries>[
                      DoughnutSeries<double, String>(
                        radius: '100%',
                        innerRadius: '84%',
                        strokeWidth: 1,
                        strokeColor: Colors.white,
                        dataSource: widget.model.statusAplicacoes,
                        xValueMapper: (double data, _) => data.toString(),
                        yValueMapper: (double data, _) => 1,
                        pointColorMapper: (double data, _) => data > 0
                            ? ArielColors.arielGreen
                            : ArielColors.disable,
                      ),
                    ],
                  ),
                ),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: widget.model.atual
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 24)),
                          primary: ArielColors.cicloColor,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RegistroAplicacaoWidget(model: widget.model)),
                        ),
                        child: Texto(
                          "Nova Aplicação".toUpperCase(),
                          size:
                              SizeConfig.of(context).dynamicScaleSize(size: 11),
                          color: Colors.white,
                          fontWeight: Weight.bold,
                          padding: const EdgeInsets.all(0),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(100, 36),
                    primary: ArielColors.cicloColor,
                    side: const BorderSide(
                      color: ArielColors.cicloColor,
                      width: 1.5,
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetalheCicloWidget(model: widget.model)),
                  ),
                  child: Texto(
                    "DETALHES",
                    size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                    color: ArielColors.cicloColor,
                    fontWeight: Weight.bold,
                    padding: const EdgeInsets.all(0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
