import 'package:ariel_app/core/ariel_icons_icons.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ListaCiclos extends StatelessWidget {
  final String titulo;
  final List<CicloModel> lista;
  final bool ativo;

  const ListaCiclos({
    Key? key,
    required this.titulo,
    required this.lista,
    this.ativo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DivisoriaDecorada(
          titulo: titulo,
          cor: ArielColors.cicloColor,
          padding: const EdgeInsets.only(top: 16),
        ),
        Column(
          children: lista
              .map((ciclo) => _CicloWidget(
                    model: ciclo,
                    ativo: ativo,
                    color:
                        ativo ? ArielColors.cicloColor : ArielColors.textLight,
                    background: ativo
                        ? ArielColors.cicloFundoColor
                        : ArielColors.disable,
                  ))
              .toList(),
        )
      ],
    );
  }
}

class _CicloWidget extends StatelessWidget {
  final CicloModel model;
  final bool ativo;
  final Color color;
  final Color background;

  const _CicloWidget(
      {Key? key,
      required this.model,
      required this.ativo,
      required this.color,
      required this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.of(context).dynamicScaleSize(size: 8)),
      child: Container(
        color: background,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.of(context).dynamicScaleSize(size: 6)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: Row(children: [
                  Icon(
                    ArielIcons.aplicacao,
                    color: color,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.of(context)
                              .dynamicScaleSize(size: 12))),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texto(
                          "${model.medicamento} ${model.dosagem}",
                          fontWeight: Weight.bold,
                          size:
                              SizeConfig.of(context).dynamicScaleSize(size: 12),
                        ),
                        Row(children: [
                          Texto(
                            "${ativo ? "PRÓXIMA" : "ÚLTIMA"} DOSE",
                            color: color,
                            fontWeight: Weight.bold,
                            size: SizeConfig.of(context)
                                .dynamicScaleSize(size: 10),
                            padding: EdgeInsets.only(top: 6),
                          ),
                          Texto(
                            ativo
                                ? DateFormat("dd/MM/yyyy").format(model
                                    .aplicacoes
                                    .where((element) => element.feito == false)
                                    .first
                                    .data)
                                : DateFormat("dd/MM/yyyy")
                                    .format(model.aplicacoes.last.data),
                            fontWeight: Weight.regular,
                            color: ativo ? ArielColors.textPrimary : color,
                            size: SizeConfig.of(context)
                                .dynamicScaleSize(size: 10),
                            padding: EdgeInsets.only(top: 6, left: 16),
                          ),
                        ])
                      ]),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: SizedBox(
                  height: SizeConfig.of(context).dynamicScaleSize(size: 75),
                  width: SizeConfig.of(context).dynamicScaleSize(size: 75),
                  child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Texto(
                              model.statusAplicacoes
                                  .where((element) => element == 1)
                                  .length
                                  .toString(),
                              fontWeight: Weight.bold,
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 18),
                            ),
                            Texto(
                              "/${model.statusAplicacoes.length}",
                              color: ArielColors.cicloColor,
                              fontWeight: Weight.bold,
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                    series: <CircularSeries>[
                      DoughnutSeries<double, String>(
                        radius: '100%',
                        innerRadius: '84%',
                        strokeWidth: 1.1,
                        strokeColor: ativo ? Colors.white : background,
                        dataSource: model.statusAplicacoes,
                        xValueMapper: (double data, _) => data.toString(),
                        yValueMapper: (double data, _) => 1,
                        pointColorMapper: (double data, _) => data > 0
                            ? ArielColors.arielGreen
                            : ArielColors.disabledGradientLight,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
