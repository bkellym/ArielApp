import 'package:ariel_app/core/models/exame_model.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/widgets/exame/detalhe/detalhe_widget.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/widgets/exame/inserirResultados/inserir_resultado_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemExameWidget extends StatefulWidget {
  final ExameModel model;

  const ItemExameWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<ItemExameWidget> createState() => _ItemExameWidgetState();
}

class _ItemExameWidgetState extends State<ItemExameWidget> {
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
                        "TIPO",
                        size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                        color: ArielColors.exameColor,
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
                            color: ArielColors.exameColor,
                          ),
                          Texto(
                            widget.model.tipo,
                            size: SizeConfig.of(context)
                                .dynamicScaleSize(size: 11),
                            fontWeight: Weight.bold,
                            padding: const EdgeInsets.only(left: 8),
                          ),
                        ],
                      )
                    ],
                  ),
                  const VerticalDivider(width: 16),
                  Container(
                      padding: EdgeInsets.only(
                          top: SizeConfig.of(context)
                              .dynamicScaleSize(size: 30)),
                      height: SizeConfig.of(context).dynamicScaleSize(size: 60),
                      child: VerticalDivider(
                          color: ArielColors.exameColor,
                          width:
                              SizeConfig.of(context).dynamicScaleSize(size: 0),
                          thickness: 1)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texto(
                        "DATA",
                        size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                        color: ArielColors.exameColor,
                        fontWeight: Weight.bold,
                        padding: EdgeInsets.only(
                          bottom:
                              SizeConfig.of(context).dynamicScaleSize(size: 6),
                        ),
                      ),
                      Texto(
                        DateFormat("dd/MM/yyyy").format(widget.model.dataHora),
                        size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                        fontWeight: Weight.medium,
                        padding: EdgeInsets.only(
                          left:
                              SizeConfig.of(context).dynamicScaleSize(size: 8),
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(width: 16),
                  Container(
                      padding: EdgeInsets.only(
                          top: SizeConfig.of(context)
                              .dynamicScaleSize(size: 30)),
                      height: SizeConfig.of(context).dynamicScaleSize(size: 60),
                      child: VerticalDivider(
                          color: ArielColors.exameColor,
                          width:
                              SizeConfig.of(context).dynamicScaleSize(size: 0),
                          thickness: 1)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texto(
                        "HORÁRIO",
                        size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                        color: ArielColors.exameColor,
                        fontWeight: Weight.bold,
                        padding: EdgeInsets.only(
                          bottom:
                              SizeConfig.of(context).dynamicScaleSize(size: 6),
                        ),
                      ),
                      Texto(
                        DateFormat("hh:mm a").format(widget.model.dataHora),
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
            ],
          ),
          const Divider(height: 4, color: Colors.transparent),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            SizeConfig.of(context).dynamicScaleSize(size: 24)),
                    primary: ArielColors.exameColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InserirResultadoWidget(
                                model: widget.model,
                              )),
                    );
                  },
                  child: Texto(
                    "inserir resultados".toUpperCase(),
                    size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                    color: Colors.white,
                    fontWeight: Weight.bold,
                    padding: const EdgeInsets.all(0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(100, 36),
                    primary: ArielColors.exameColor,
                    side: const BorderSide(
                      color: ArielColors.exameColor,
                      width: 1.5,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalheExameWidget(
                                model: widget.model,
                              )),
                    );
                  },
                  child: Texto(
                    "detalhes".toUpperCase(),
                    size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                    color: ArielColors.exameColor,
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
