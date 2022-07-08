import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/detalhe/campo_destaque.dart';
import 'package:ariel_app/components/detalhe/campo_detalhe.dart';
import 'package:ariel_app/components/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/models/consulta_model.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/consulta/cadastro_edicao/cadastro_edicao_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalheConsulta extends StatefulWidget {
  final ConsultaModel model;

  const DetalheConsulta({Key? key, required this.model}) : super(key: key);

  @override
  State<DetalheConsulta> createState() => _DetalheConsultaState();
}

class _DetalheConsultaState extends State<DetalheConsulta> {
  final double leftPadding = 32;

  @override
  Widget build(BuildContext context) {
    return DetalheWidget(
      titulo: "Exames \ne Consultas",
      tituloSize: 20,
      subTitulo: ["DETALHES", " DA CONSULTA"],
      imgFundo: Image.asset('assets/images/ciclos.png').image,
      color: ArielColors.consultaColor,
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CampoDestaque(
                    titulo: "especialista",
                    valor: widget.model.especialidade,
                    leftPadding: leftPadding,
                    color: ArielColors.consultaColor),
                CampoDetalhe(
                  titulo: "MÉDICO",
                  valor: widget.model.medico,
                  leftPadding: leftPadding,
                  color: ArielColors.consultaColor,
                  lineColor: ArielColors.consultaColor,
                ),
              ],
            ),
            Row(
              children: [
                CampoDetalhe(
                  titulo: "DATA DO EXAME",
                  valor: DateFormat("dd/MM/yyyy").format(widget.model.dataHora),
                  leftPadding: leftPadding,
                  color: ArielColors.consultaColor,
                  lineColor: ArielColors.consultaColor,
                ),
                CampoDetalhe(
                  titulo: "HORARIO",
                  valor: DateFormat("hh:mm a").format(widget.model.dataHora),
                  leftPadding: leftPadding,
                  color: ArielColors.consultaColor,
                  lineColor: ArielColors.consultaColor,
                ),
              ],
            ),
            CampoDetalhe(
              titulo: "LOCAL",
              valor: widget.model.endereco,
              leftPadding: leftPadding,
              color: ArielColors.consultaColor,
              lineColor: ArielColors.consultaColor,
            ),
            CampoDetalhe(
              titulo: "RECOMENDAÇÕES",
              valor: widget.model.detalhes,
              leftPadding: leftPadding,
              color: ArielColors.consultaColor,
              lineColor: ArielColors.consultaColor,
            ),
            const Divider(
              height: 16,
              color: Color(0x00FFFFFF),
            ),
            BotaoPadrao(
              label: "EDITAR CONSULTA",
              height: 40,
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
              internalPadding: 6,
              padding: const EdgeInsets.all(0),
              textStyle: TextStyle(
                  fontSize: SizeConfig.of(context).dynamicScaleSize(size: 9)),
            )
          ],
        ),
      ),
    );
  }
}
