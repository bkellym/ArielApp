import 'package:ariel_app/core/models/consulta_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/campo_destaque_novo.dart';
import 'package:ariel_app/core/shared/detalhe/campo_detalhe_novo.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/consulta/cadastro_edicao/cadastro_edicao_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalheConsulta extends StatefulWidget {
  final ConsultaModel model;

  const DetalheConsulta({Key? key, required this.model}) : super(key: key);

  @override
  State<DetalheConsulta> createState() => _DetalheConsultaState();
}

class _DetalheConsultaState extends State<DetalheConsulta> {
  @override
  Widget build(BuildContext context) {
    final double leftPadding =
        SizeConfig.of(context).dynamicScaleSize(size: 32);

    return DetalheWidget(
      titulo: "Exames \ne Consultas",
      tituloSize: 20,
      subTitulo: ["DETALHES", " DA CONSULTA"],
      imgFundo: Image.asset('assets/images/ciclos.png').image,
      color: ArielColors.consultaColor,
      child: Material(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CampoDestaque(
                titulo: widget.model.especialidade,
                color: ArielColors.consultaColor,
                icon: Icons.bookmark_border,
              ),
              CampoDetalhe(
                titulo: "DATA DA CONSULTA",
                valor: DateFormat("dd/MM/yyyy").format(widget.model.dataHora),
                color: ArielColors.consultaColor,
              ),
              CampoDetalhe(
                titulo: "HORARIO DA CONSULTA",
                valor: DateFormat("hh:mm a").format(widget.model.dataHora),
                color: ArielColors.consultaColor,
              ),
              CampoDetalhe(
                titulo: "ESPECIALISTA",
                valor: widget.model.medico,
                color: ArielColors.consultaColor,
              ),
              CampoDetalhe(
                titulo: "LOCAL",
                valor: widget.model.endereco,
                color: ArielColors.consultaColor,
              ),
              CampoDetalhe(
                titulo: "OBSERVAÇÕES",
                valor: widget.model.detalhes,
                color: ArielColors.consultaColor,
              ),
              const Divisoria(),
              BotaoPadrao(
                label: "EDITAR CONSULTA",
                height: 40,
                padding: const EdgeInsets.all(0),
                textStyle: TextStyle(
                    fontSize: SizeConfig.of(context).dynamicScaleSize(size: 12),
                    fontWeight: Weight.bold),
                internalPadding:
                    SizeConfig.of(context).dynamicScaleSize(size: 4),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroEdicaoConsulta(
                              userUid: widget.model.userUid,
                              model: widget.model,
                            )),
                  );
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
