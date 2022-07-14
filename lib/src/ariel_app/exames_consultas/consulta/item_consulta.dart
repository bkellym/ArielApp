import 'package:ariel_app/core/models/consulta_model.dart';
import 'package:ariel_app/core/shared/detalhe/campo_destaque.dart';
import 'package:ariel_app/core/shared/detalhe/campo_detalhe.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/consulta/detalhe/detalhe_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemConsultaWidget extends StatefulWidget {
  final ConsultaModel model;

  const ItemConsultaWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<ItemConsultaWidget> createState() => _ItemConsultaWidgetState();
}

class _ItemConsultaWidgetState extends State<ItemConsultaWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double leftPadding =
        SizeConfig.of(context).dynamicScaleSize(size: 32);

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
                const VerticalDivider(width: 16),
                CampoDestaque(
                  titulo: "Especialidade",
                  valor: widget.model.especialidade,
                  color: ArielColors.consultaColor,
                  asIcon: true,
                ),
                CampoDetalhe(
                  titulo: "DATA",
                  valor: DateFormat("dd/MM/yyyy").format(widget.model.dataHora),
                  color: ArielColors.consultaColor,
                  lineColor: ArielColors.consultaColor,
                  padding: EdgeInsets.only(
                    top: SizeConfig.of(context).dynamicScaleSize(size: 0),
                    left: leftPadding,
                  ),
                ),
                CampoDetalhe(
                  titulo: "HORÁRIO",
                  valor: DateFormat("hh:mm a").format(widget.model.dataHora),
                  color: ArielColors.consultaColor,
                  lineColor: ArielColors.consultaColor,
                  padding: EdgeInsets.only(
                    top: SizeConfig.of(context).dynamicScaleSize(size: 0),
                    left: leftPadding,
                  ),
                ),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(100, 36),
                    primary: ArielColors.consultaColor,
                    side: const BorderSide(
                      color: ArielColors.consultaColor,
                      width: 1.5,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalheConsulta(
                                model: widget.model,
                              )),
                    );
                  },
                  child: Texto(
                    "detalhes".toUpperCase(),
                    size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                    color: ArielColors.consultaColor,
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
