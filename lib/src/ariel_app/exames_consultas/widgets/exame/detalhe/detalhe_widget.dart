import 'package:ariel_app/core/models/exame_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/campo_destaque.dart';
import 'package:ariel_app/core/shared/detalhe/campo_detalhe.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/widgets/exame/cadastro_edicao/cadastro_widget.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/widgets/exame/inserirResultados/inserir_resultado_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalheExameWidget extends StatefulWidget {
  final ExameModel model;

  const DetalheExameWidget({Key? key, required this.model}) : super(key: key);

  @override
  DetalheExameWidgetState createState() => DetalheExameWidgetState();
}

class DetalheExameWidgetState extends State<DetalheExameWidget> {
  @override
  Widget build(BuildContext context) {
    final double leftPadding =
        SizeConfig.of(context).dynamicScaleSize(size: 32);

    return DetalheWidget(
      titulo: "exames e\nconsultas",
      subTitulo: const ["detalhes", " do exame"],
      imgFundo: Image.asset('assets/images/ciclos.png').image,
      tituloSize: 20,
      color: ArielColors.exameColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CampoDestaque(
              titulo: "exame",
              valor: widget.model.tipo,
              padding: EdgeInsets.only(left: leftPadding),
              color: ArielColors.exameColor),
          Row(
            children: [
              CampoDetalhe(
                titulo: "DATA DO EXAME",
                valor: DateFormat("dd/MM/yyyy").format(widget.model.dataHora),
                padding: EdgeInsets.only(left: leftPadding),
                color: ArielColors.exameColor,
                lineColor: ArielColors.exameColor,
              ),
              CampoDetalhe(
                titulo: "HORARIO",
                valor: DateFormat("hh:mm a").format(widget.model.dataHora),
                padding: EdgeInsets.only(left: leftPadding),
                color: ArielColors.exameColor,
                lineColor: ArielColors.exameColor,
              ),
            ],
          ),
          CampoDetalhe(
            titulo: "LOCAL",
            valor: widget.model.local,
            padding: EdgeInsets.only(left: leftPadding),
            color: ArielColors.exameColor,
            lineColor: ArielColors.exameColor,
          ),
          CampoDetalhe(
            titulo: "RECOMENDAÇÕES",
            valor: widget.model.detalhes,
            padding: EdgeInsets.only(left: leftPadding),
            color: ArielColors.exameColor,
            lineColor: ArielColors.exameColor,
          ),
          const Divisoria(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BotaoPadrao(
                label: "INSERIR RESULTADO",
                height: 40,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InserirResultadoWidget(
                              model: widget.model,
                            )),
                  );
                },
                internalPadding: 0,
                padding: const EdgeInsets.only(left: 32),
                textStyle: const TextStyle(fontSize: 10),
              ),
              BotaoPadrao(
                label: "EDITAR EXAME",
                height: 40,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroExameWidget(
                              userUid: widget.model.userUid,
                              model: widget.model,
                            )),
                  );
                },
                internalPadding: 6,
                padding: EdgeInsets.only(
                    right: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                textStyle: TextStyle(
                    fontSize: SizeConfig.of(context).dynamicScaleSize(size: 9)),
              )
            ],
          )
        ],
      ),
    );
  }
}
