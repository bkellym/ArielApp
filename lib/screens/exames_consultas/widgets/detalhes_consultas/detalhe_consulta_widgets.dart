import 'package:ariel_app/components/CampoDetalhe.dart';
import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/input/campo_data.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/detalhes_consultas/detalhe_consulta.dart';
import 'package:flutter/material.dart';

class Detalhe extends StatelessWidget {
  const Detalhe({Key? key}) : super(key: key);

  final double leftPadding = 32;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Texto(
              "DETALHES",
              size: SizeConfig.of(context).dynamicScaleSize(size: 18),
              color: ArielColors.consultaColor,
              fontWeight: Weight.bold,
            ),
            Texto(
              " DA CONSULTA",
              size: SizeConfig.of(context).dynamicScaleSize(size: 18),
              color: ArielColors.consultaColor,
              fontWeight: Weight.regular,
            ),
          ],
        ),
        const Divider(height: 16, thickness: 0, color: Color(0x00FFFFFF)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Texto(
              "ESPECIALIDADE",
              size: SizeConfig.of(context).dynamicScaleSize(size: 10),
              color: ArielColors.consultaColor,
              fontWeight: Weight.bold,
              padding: EdgeInsets.only(
                  left: SizeConfig.of(context)
                      .dynamicScaleSize(size: leftPadding),
                  bottom: SizeConfig.of(context).dynamicScaleSize(size: 6)),
            ),
            Texto(
              "teste",
              size: SizeConfig.of(context).dynamicScaleSize(size: 11),
              fontWeight: Weight.bold,
              padding: EdgeInsets.only(
                left:
                    SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
                bottom: SizeConfig.of(context).dynamicScaleSize(size: 12),
              ),
            ),
            CampoDetalhe(
              titulo: "MÉDICO",
              valor: "05/04/2020",
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
              valor: "05/04/2020",
              leftPadding: leftPadding,
              color: ArielColors.consultaColor,
              lineColor: ArielColors.consultaColor,
            ),
            CampoDetalhe(
              titulo: "HORARIO",
              valor: "1ª aplicação de 4",
              leftPadding: leftPadding,
              color: ArielColors.consultaColor,
              lineColor: ArielColors.consultaColor,
            ),
          ],
        ),
        CampoDetalhe(
          titulo: "LOCAL",
          valor: "05/04/2020",
          leftPadding: leftPadding,
          color: ArielColors.consultaColor,
          lineColor: ArielColors.consultaColor,
        ),
        CampoDetalhe(
          titulo: "RECOMENDAÇÕES",
          valor: "09/09/2020",
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
                  builder: (context) => const DetalheConsulta(widgetIndex: 1)),
            );
          },
          internalPadding: 6,
          padding: const EdgeInsets.all(0),
          textStyle: TextStyle(
              fontSize: SizeConfig.of(context).dynamicScaleSize(size: 9)),
        )
      ],
    );
  }
}

class CadastrarOuEditar extends StatelessWidget {
  CadastrarOuEditar({Key? key}) : super(key: key);

  final double leftPadding = 32;
  final TextEditingController dtInicio = TextEditingController();
  final TextEditingController dtUltimaAplicacao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Texto(
                "NOVA",
                size: SizeConfig.of(context).dynamicScaleSize(size: 18),
                color: ArielColors.consultaColor,
                fontWeight: Weight.bold,
              ),
              Texto(
                " CONSULTA",
                size: SizeConfig.of(context).dynamicScaleSize(size: 18),
                color: ArielColors.consultaColor,
                fontWeight: Weight.regular,
              ),
            ],
          ),
          const Divider(
            height: 16,
            color: Color(0x00FFFFFF),
          ),
          Texto(
            "MÉDICO",
            color: ArielColors.consultaColor,
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
          CampoTexto(
            leftPadding: leftPadding,
            rightPadding: leftPadding,
          ),
          Texto(
            "ESPECIALIDADE",
            color: ArielColors.consultaColor,
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
          CampoTexto(
            leftPadding: leftPadding,
            rightPadding: leftPadding,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
              left: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texto(
                        "DATA DA CONSULTA",
                        color: ArielColors.consultaColor,
                        fontWeight: Weight.semibold,
                        size: SizeConfig.of(context).dynamicScaleSize(size: 9),
                        padding: EdgeInsets.only(
                          bottom: SizeConfig.of(context).dynamicScaleSize(
                            size: 4,
                          ),
                        ),
                      ),
                      CampoData(
                        color: ArielColors.consultaColor,
                        controller: dtInicio,
                        padding: EdgeInsets.only(
                          right: 0,
                          bottom: SizeConfig.of(context).dynamicScaleSize(
                            size: 8,
                          ),
                        ),
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
                        "HORÁRIO",
                        color: ArielColors.consultaColor,
                        fontWeight: Weight.semibold,
                        size: SizeConfig.of(context).dynamicScaleSize(size: 9),
                        padding: EdgeInsets.only(
                          left: 12,
                          bottom: SizeConfig.of(context).dynamicScaleSize(
                            size: 4,
                          ),
                        ),
                      ),
                      const CampoTexto(
                        rightPadding: 0,
                        leftPadding: 12,
                        bottomPadding: 8,
                        textInputType: TextInputType.number,
                        label: '',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Texto(
            "LOCAL",
            color: ArielColors.consultaColor,
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
          CampoTexto(
            leftPadding: leftPadding,
            rightPadding: leftPadding,
          ),
          Texto(
            "RECOMENDAÇÕES",
            color: ArielColors.consultaColor,
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
          CampoTexto(
            maxLines: 3,
            leftPadding: leftPadding,
            rightPadding: leftPadding,
          ),
          const Divider(height: 32, color: Color(0x00FFFFFF)),
          BotaoPadrao(
              label: "SALVAR CONSULTA",
              height: SizeConfig.of(context).dynamicScaleSize(size: 40),
              padding: EdgeInsets.all(0),
              textStyle: TextStyle(
                  fontSize: SizeConfig.of(context).dynamicScaleSize(size: 12),
                  fontWeight: Weight.bold),
              internalPadding: SizeConfig.of(context).dynamicScaleSize(size: 8),
              onPressed: () {}),
        ],
      ),
    );
  }
}
