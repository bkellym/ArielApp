import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/detalhe/campo_detalhe.dart';
import 'package:ariel_app/components/input/campo_data.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/detalhe_exame/detalhe_exame.dart';
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
              color: ArielColors.exameColor,
              fontWeight: Weight.bold,
            ),
            Texto(
              " DO EXAME",
              size: SizeConfig.of(context).dynamicScaleSize(size: 18),
              color: ArielColors.exameColor,
              fontWeight: Weight.regular,
            ),
          ],
        ),
        const Divider(height: 16, thickness: 0, color: Color(0x00FFFFFF)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Texto(
              "EXAME",
              size: SizeConfig.of(context).dynamicScaleSize(size: 10),
              color: ArielColors.exameColor,
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
          ],
        ),
        Row(
          children: [
            CampoDetalhe(
              titulo: "DATA DO EXAME",
              valor: "05/04/2020",
              leftPadding: leftPadding,
              color: ArielColors.exameColor,
              lineColor: ArielColors.exameColor,
            ),
            CampoDetalhe(
              titulo: "HORARIO",
              valor: "1ª aplicação de 4",
              leftPadding: leftPadding,
              color: ArielColors.exameColor,
              lineColor: ArielColors.exameColor,
            ),
          ],
        ),
        CampoDetalhe(
          titulo: "LOCAL",
          valor: "05/04/2020",
          leftPadding: leftPadding,
          color: ArielColors.exameColor,
          lineColor: ArielColors.exameColor,
        ),
        CampoDetalhe(
          titulo: "RECOMENDAÇÕES",
          valor: "09/09/2020",
          leftPadding: leftPadding,
          color: ArielColors.exameColor,
          lineColor: ArielColors.exameColor,
        ),
        const Divider(
          height: 16,
          color: Color(0x00FFFFFF),
        ),
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
                      builder: (context) => const DetalheExame(widgetIndex: 2)),
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
                      builder: (context) => const DetalheExame(widgetIndex: 1)),
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
                "CADASTRAR",
                size: SizeConfig.of(context).dynamicScaleSize(size: 18),
                color: ArielColors.exameColor,
                fontWeight: Weight.bold,
              ),
              Texto(
                " EXAME",
                size: SizeConfig.of(context).dynamicScaleSize(size: 18),
                color: ArielColors.exameColor,
                fontWeight: Weight.regular,
              ),
            ],
          ),
          const Divider(
            height: 16,
            color: Color(0x00FFFFFF),
          ),
          Texto(
            "TIPO DE EXAME",
            color: ArielColors.exameColor,
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
                        "DATA DO EXAME",
                        color: ArielColors.exameColor,
                        fontWeight: Weight.semibold,
                        size: SizeConfig.of(context).dynamicScaleSize(size: 9),
                        padding: EdgeInsets.only(
                          bottom: SizeConfig.of(context).dynamicScaleSize(
                            size: 4,
                          ),
                        ),
                      ),
                      CampoData(
                        color: ArielColors.exameColor,
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
                        color: ArielColors.exameColor,
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
            color: ArielColors.exameColor,
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
            "DETALHES E RECOMENDAÇÕES",
            color: ArielColors.exameColor,
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
              label: "SALVAR EXAME",
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

class InserirResultados extends StatelessWidget {
  InserirResultados({Key? key}) : super(key: key);

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
                "RESULTADO",
                size: SizeConfig.of(context).dynamicScaleSize(size: 18),
                color: ArielColors.exameColor,
                fontWeight: Weight.bold,
              ),
              Texto(
                " DO EXAME",
                size: SizeConfig.of(context).dynamicScaleSize(size: 18),
                color: ArielColors.exameColor,
                fontWeight: Weight.regular,
              ),
            ],
          ),
          const Divider(
            height: 16,
            color: Color(0x00FFFFFF),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Texto(
                "EXAME",
                size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                color: ArielColors.exameColor,
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
                  left: SizeConfig.of(context)
                      .dynamicScaleSize(size: leftPadding),
                  bottom: SizeConfig.of(context).dynamicScaleSize(size: 12),
                ),
              ),
            ],
          ),
          const Divider(
            height: 16,
            color: Color(0x00FFFFFF),
          ),
          Row(
            children: [
              CampoDetalhe(
                titulo: "DATA DO EXAME",
                valor: "09/09/2020",
                leftPadding: leftPadding,
                color: ArielColors.exameColor,
                lineColor: ArielColors.exameColor,
              ),
              CampoDetalhe(
                titulo: "HORÁRIO",
                valor: "09/09/2020",
                leftPadding: leftPadding,
                color: ArielColors.exameColor,
                lineColor: ArielColors.exameColor,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.of(context).dynamicScaleSize(size: 8),
              right: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
              left: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
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
                        size: SizeConfig.of(context).dynamicScaleSize(size: 9),
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
                        size: SizeConfig.of(context).dynamicScaleSize(size: 9),
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
              internalPadding: SizeConfig.of(context).dynamicScaleSize(size: 8),
              onPressed: () {}),
        ],
      ),
    );
  }
}
