import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/models/aplicacao_model.dart';
import 'package:ariel_app/models/ciclo_model.dart';
import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/detalhe_ciclo.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const VerticalDivider(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texto(
                        "MEDICAMENTO",
                        size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                        color: ArielColors.cicloColor,
                        fontWeight: Weight.bold,
                        padding: const EdgeInsets.only(left: 16, bottom: 6),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: SizeConfig.of(context)
                                .dynamicScaleSize(size: 9),
                            color: ArielColors.cicloColor,
                          ),
                          Texto(
                            widget.model.medicamento,
                            size: SizeConfig.of(context)
                                .dynamicScaleSize(size: 11),
                            fontWeight: Weight.bold,
                            padding: const EdgeInsets.only(left: 8),
                          ),
                        ],
                      )
                    ],
                  ),
                  const VerticalDivider(width: 10),
                  Container(
                      padding: EdgeInsets.only(
                          top: SizeConfig.of(context)
                              .dynamicScaleSize(size: 30)),
                      height: SizeConfig.of(context).dynamicScaleSize(size: 60),
                      child: VerticalDivider(
                          color: ArielColors.cicloColor,
                          width:
                              SizeConfig.of(context).dynamicScaleSize(size: 0),
                          thickness: 1.5)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texto(
                        "INÍCIO DO TRATAMENTO",
                        size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                        color: ArielColors.cicloColor,
                        fontWeight: Weight.bold,
                        padding: EdgeInsets.only(
                          bottom:
                              SizeConfig.of(context).dynamicScaleSize(size: 6),
                        ),
                      ),
                      Texto(
                        DateFormat("dd/MM/yyyy")
                            .format(DateTime.parse(widget.model.dataIncio))
                            .toString(),
                        size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                        fontWeight: Weight.medium,
                        padding: EdgeInsets.only(
                          left:
                              SizeConfig.of(context).dynamicScaleSize(size: 8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: SizedBox(
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
                  )
                ],
              )
            ],
          ),
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
                        onPressed: () {},
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DetalheCiclo(widgetIndex: 0)),
                    );
                  },
                  child: Texto(
                    widget.model.atual
                        ? "Editar".toUpperCase()
                        : "Detalhes".toUpperCase(),
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
