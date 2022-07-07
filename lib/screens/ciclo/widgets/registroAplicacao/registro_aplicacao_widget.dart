import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/detalhe/campo_detalhe.dart';
import 'package:ariel_app/components/detalhe/detalhe_widget.dart';
import 'package:ariel_app/components/input/campo_data.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class RegistroAplicacaoWidget extends StatefulWidget {
  const RegistroAplicacaoWidget({Key? key}) : super(key: key);

  @override
  RegistroAplicacaoWidgetState createState() => RegistroAplicacaoWidgetState();
}

class RegistroAplicacaoWidgetState extends State<RegistroAplicacaoWidget> {
  final double leftPadding = 32;

  @override
  Widget build(BuildContext context) {
    return DetalheWidget(
      titulo: "Ciclos",
      subTitulo: ["registrar", " aplicação"],
      color: ArielColors.secundary,
      child: _Conteudo(),
    );
  }
}

class _Conteudo extends StatelessWidget {
  _Conteudo({Key? key}) : super(key: key);

  final double leftPadding = 32;
  final TextEditingController dtAplicacao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texto(
                  "MEDICAMENTO",
                  size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                  color: ArielColors.cicloColor,
                  fontWeight: Weight.bold,
                  padding: EdgeInsets.only(
                      left: SizeConfig.of(context)
                          .dynamicScaleSize(size: leftPadding),
                      bottom: SizeConfig.of(context).dynamicScaleSize(size: 8)),
                ),
                Texto(
                  "teste",
                  size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                  fontWeight: Weight.bold,
                  padding: EdgeInsets.only(
                    left: SizeConfig.of(context)
                        .dynamicScaleSize(size: leftPadding),
                    bottom: SizeConfig.of(context).dynamicScaleSize(size: 12),
                  ),
                ),
              ],
            ),
            const CampoDetalhe(
              titulo: "DOSAGEM",
              valor: "teste",
              leftPadding: 0,
              color: ArielColors.cicloColor,
              lineColor: ArielColors.secundary,
            ),
            Padding(
              padding: EdgeInsets.only(right: leftPadding),
              child: const CampoDetalhe(
                titulo: "qtd por ciclo",
                valor: "Testando",
                leftPadding: 0,
                color: ArielColors.cicloColor,
                lineColor: ArielColors.secundary,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampoDetalhe(
              titulo: "Início do tratamento",
              valor: "teste",
              leftPadding: leftPadding,
              color: ArielColors.cicloColor,
              lineColor: ArielColors.secundary,
            ),
            Padding(
              padding: EdgeInsets.only(right: leftPadding),
              child: const CampoDetalhe(
                titulo: "fase atual do ciclo",
                valor: "Testando",
                leftPadding: 0,
                color: ArielColors.cicloColor,
                lineColor: ArielColors.secundary,
              ),
            ),
          ],
        ),
        const Divider(height: 4, color: Color(0x00FFFFFF)),
        Texto(
          "DATA DA ULTIMA APLICAÇÃO",
          color: ArielColors.secundary,
          fontWeight: Weight.semibold,
          size: SizeConfig.of(context).dynamicScaleSize(size: 9),
          padding: EdgeInsets.only(
            left: SizeConfig.of(context).dynamicScaleSize(
              size: leftPadding,
            ),
            bottom: SizeConfig.of(context).dynamicScaleSize(
              size: 4,
            ),
          ),
        ),
        CampoData(
          controller: dtAplicacao,
          padding: EdgeInsets.only(
            left: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
            right: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
            bottom: SizeConfig.of(context).dynamicScaleSize(size: 8),
          ),
        ),
        const Divider(height: 32, color: Color(0x00FFFFFF)),
        BotaoPadrao(
            label: "SALVAR APLICAÇÃO",
            height: SizeConfig.of(context).dynamicScaleSize(size: 40),
            padding: const EdgeInsets.all(0),
            textStyle: TextStyle(
                fontSize: SizeConfig.of(context).dynamicScaleSize(size: 12),
                fontWeight: Weight.bold),
            internalPadding: SizeConfig.of(context).dynamicScaleSize(size: 8),
            onPressed: () {}),
      ]),
    );
  }
}
