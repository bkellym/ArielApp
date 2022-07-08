import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/detalhe/campo_destaque.dart';
import 'package:ariel_app/components/detalhe/campo_detalhe.dart';
import 'package:ariel_app/components/detalhe/detalhe_widget.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/core/models/exame_model.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InserirResultadoWidget extends StatefulWidget {
  final ExameModel model;

  const InserirResultadoWidget({Key? key, required this.model})
      : super(key: key);

  @override
  State<InserirResultadoWidget> createState() => _InserirResultadoWidgetState();
}

class _InserirResultadoWidgetState extends State<InserirResultadoWidget> {
  final double leftPadding = 32;
  final TextEditingController dtInicio = TextEditingController();
  final TextEditingController dtUltimaAplicacao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DetalheWidget(
      titulo: "EXAMES E\nCONSULTAS",
      subTitulo: const ["resultado", " do exame"],
      tituloSize: 20,
      imgFundo: Image.asset('assets/images/ciclos.png').image,
      color: ArielColors.exameColor,
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampoDestaque(
                titulo: "Exame",
                valor: widget.model.tipo,
                leftPadding: leftPadding,
                color: ArielColors.exameColor),
            Row(
              children: [
                CampoDetalhe(
                  titulo: "DATA DO EXAME",
                  valor: DateFormat("dd/MM/yyyy").format(widget.model.dataHora),
                  leftPadding: leftPadding,
                  color: ArielColors.exameColor,
                  lineColor: ArielColors.exameColor,
                ),
                CampoDetalhe(
                  titulo: "HORÁRIO",
                  valor: DateFormat("hh:mm a").format(widget.model.dataHora),
                  leftPadding: leftPadding,
                  color: ArielColors.exameColor,
                  lineColor: ArielColors.exameColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.of(context).dynamicScaleSize(size: 8),
                right:
                    SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
                left:
                    SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texto(
                          "PARAMETRO",
                          color: ArielColors.exameColor,
                          fontWeight: Weight.semibold,
                          size:
                              SizeConfig.of(context).dynamicScaleSize(size: 9),
                          padding: EdgeInsets.only(
                            bottom: SizeConfig.of(context).dynamicScaleSize(
                              size: 4,
                            ),
                          ),
                        ),
                        const CampoTexto(
                          leftPadding: 0,
                          rightPadding: 12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texto(
                          "DOSAGEM",
                          color: ArielColors.exameColor,
                          fontWeight: Weight.semibold,
                          size:
                              SizeConfig.of(context).dynamicScaleSize(size: 9),
                          padding: EdgeInsets.only(
                            left: 0,
                            bottom: SizeConfig.of(context).dynamicScaleSize(
                              size: 4,
                            ),
                          ),
                        ),
                        const CampoTexto(
                          leftPadding: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 32, color: Color(0x00FFFFFF)),
            BotaoPadrao(
                label: "SALVAR ALTERAÇÕES",
                height: SizeConfig.of(context).dynamicScaleSize(size: 40),
                padding: EdgeInsets.all(0),
                textStyle: TextStyle(
                    fontSize: SizeConfig.of(context).dynamicScaleSize(size: 12),
                    fontWeight: Weight.bold),
                internalPadding:
                    SizeConfig.of(context).dynamicScaleSize(size: 8),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
