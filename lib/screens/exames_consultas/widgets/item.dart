import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/detalhe_exame/detalhe_exame.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemWidget extends StatefulWidget {
  final Color color;

  const ItemWidget({Key? key, required this.color}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
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
                        color: widget.color,
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
                            color: widget.color,
                          ),
                          Texto(
                            "teste",
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
                          color: widget.color,
                          width:
                              SizeConfig.of(context).dynamicScaleSize(size: 0),
                          thickness: 1)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texto(
                        "DATA",
                        size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                        color: widget.color,
                        fontWeight: Weight.bold,
                        padding: EdgeInsets.only(
                          bottom:
                              SizeConfig.of(context).dynamicScaleSize(size: 6),
                        ),
                      ),
                      Texto(
                        DateFormat("dd/MM/yyyy")
                            .format(DateTime.parse('2022-05-01'))
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
                  const VerticalDivider(width: 16),
                  Container(
                      padding: EdgeInsets.only(
                          top: SizeConfig.of(context)
                              .dynamicScaleSize(size: 30)),
                      height: SizeConfig.of(context).dynamicScaleSize(size: 60),
                      child: VerticalDivider(
                          color: widget.color,
                          width:
                              SizeConfig.of(context).dynamicScaleSize(size: 0),
                          thickness: 1)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texto(
                        "HORÁRIO",
                        size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                        color: widget.color,
                        fontWeight: Weight.bold,
                        padding: EdgeInsets.only(
                          bottom:
                              SizeConfig.of(context).dynamicScaleSize(size: 6),
                        ),
                      ),
                      Texto(
                        DateFormat("dd/MM/yyyy")
                            .format(DateTime.parse('2022-05-01'))
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
            ],
          ),
          const Divider(height: 16, color: Colors.transparent),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.of(context)
                              .dynamicScaleSize(size: 24)),
                      primary: widget.color,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DetalheExame(widgetIndex: 2)),
                      );
                    },
                    child: Texto(
                      "inserir resultados".toUpperCase(),
                      size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                      color: Colors.white,
                      fontWeight: Weight.bold,
                      padding: const EdgeInsets.all(0),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(100, 36),
                    primary: widget.color,
                    side: BorderSide(
                      color: widget.color,
                      width: 1.5,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DetalheExame(widgetIndex: 0)),
                    );
                  },
                  child: Texto(
                    "detalhes".toUpperCase(),
                    size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                    color: widget.color,
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
