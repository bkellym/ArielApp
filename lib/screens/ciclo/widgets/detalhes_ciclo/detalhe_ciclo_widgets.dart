import 'package:ariel_app/components/CampoDetalhe.dart';
import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/input/campo_data.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/detalhe_ciclo.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
              color: ArielColors.secundary,
              fontWeight: Weight.bold,
            ),
            Texto(
              " DO CICLO",
              size: SizeConfig.of(context).dynamicScaleSize(size: 18),
              color: ArielColors.secundary,
              fontWeight: Weight.regular,
            ),
          ],
        ),
        const Divider(height: 16, thickness: 0, color: Color(0x00FFFFFF)),
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
                CampoDetalhe(
                  titulo: "qtd por ciclo",
                  valor: "testando",
                  leftPadding: leftPadding,
                  color: ArielColors.cicloColor,
                  lineColor: ArielColors.cicloColor,
                ),
                CampoDetalhe(
                  titulo: "inicio do tratamento",
                  valor: "05/04/2020",
                  leftPadding: leftPadding,
                  color: ArielColors.cicloColor,
                  lineColor: ArielColors.cicloColor,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: SizedBox(
                height: SizeConfig.of(context).dynamicScaleSize(size: 135),
                width: SizeConfig.of(context).dynamicScaleSize(size: 120),
                child: SfCircularChart(
                  series: <CircularSeries>[
                    DoughnutSeries<double, String>(
                      radius: '100%',
                      innerRadius: '84%',
                      strokeWidth: 1,
                      strokeColor: Colors.white,
                      dataSource: const [1, 0, 0, 0],
                      xValueMapper: (double data, _) => data.toString(),
                      yValueMapper: (double data, _) => 1,
                      pointColorMapper: (double data, _) => data > 0
                          ? ArielColors.arielGreen
                          : ArielColors.disable,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            CampoDetalhe(
              titulo: "primeira aplicação",
              valor: "05/04/2020",
              leftPadding: leftPadding,
              color: ArielColors.cicloColor,
              lineColor: ArielColors.cicloColor,
            ),
            CampoDetalhe(
              titulo: "fase atual do ciclo",
              valor: "1ª aplicação de 4",
              leftPadding: leftPadding,
              color: ArielColors.cicloColor,
              lineColor: ArielColors.cicloColor,
            ),
          ],
        ),
        Row(
          children: [
            CampoDetalhe(
              titulo: "próxima aplicação",
              valor: "05/04/2020",
              leftPadding: leftPadding,
              color: ArielColors.cicloColor,
              lineColor: ArielColors.cicloColor,
            ),
            CampoDetalhe(
              titulo: "aplicação final",
              valor: "09/09/2020",
              leftPadding: leftPadding,
              color: ArielColors.cicloColor,
              lineColor: ArielColors.cicloColor,
            ),
          ],
        ),
        CampoDetalhe(
          titulo: "observações",
          valor: "Heitor, fique atento a sua próxima aplicação.",
          leftPadding: leftPadding,
          color: ArielColors.cicloColor,
          lineColor: ArielColors.cicloColor,
        ),
        const Divider(
          height: 16,
          color: Color(0x00FFFFFF),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BotaoPadrao(
              label: "NOVA APLICAÇÃO",
              height: 40,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetalheCiclo(widgetIndex: 2)),
                );
              },
              internalPadding: 6,
              padding: const EdgeInsets.only(left: 32),
              textStyle: const TextStyle(fontSize: 9),
            ),
            BotaoPadrao(
              label: "EDITAR CICLO",
              height: 40,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetalheCiclo(widgetIndex: 1)),
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
                color: ArielColors.secundary,
                fontWeight: Weight.bold,
              ),
              Texto(
                " CICLO",
                size: SizeConfig.of(context).dynamicScaleSize(size: 18),
                color: ArielColors.secundary,
                fontWeight: Weight.regular,
              ),
            ],
          ),
          const Divider(
            height: 16,
            color: Color(0x00FFFFFF),
          ),
          Texto(
            "MEDICAMENTO UTILIZADO",
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
                        "DATA DE INÍCIO DO TRATAMENTO",
                        color: ArielColors.secundary,
                        fontWeight: Weight.semibold,
                        size: SizeConfig.of(context).dynamicScaleSize(size: 9),
                        padding: EdgeInsets.only(
                          bottom: SizeConfig.of(context).dynamicScaleSize(
                            size: 4,
                          ),
                        ),
                      ),
                      CampoData(
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
                        "DOSAGEM",
                        color: ArielColors.secundary,
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
                        "APRESENTAÇÃO",
                        color: ArielColors.secundary,
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
                        "INTERVALO",
                        color: ArielColors.secundary,
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
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texto(
                        "QTD. POR CICLO",
                        color: ArielColors.secundary,
                        fontWeight: Weight.semibold,
                        size: SizeConfig.of(context).dynamicScaleSize(size: 9),
                        padding: EdgeInsets.only(
                          left: SizeConfig.of(context).dynamicScaleSize(
                            size: 4,
                          ),
                          bottom: SizeConfig.of(context).dynamicScaleSize(
                            size: 4,
                          ),
                        ),
                      ),
                      const CampoTexto(
                        leftPadding: 4,
                        rightPadding: 0,
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
            controller: dtUltimaAplicacao,
            padding: EdgeInsets.only(
              left: SizeConfig.of(context).dynamicScaleSize(
                size: leftPadding,
              ),
              right: SizeConfig.of(context).dynamicScaleSize(
                size: leftPadding,
              ),
              bottom: 8,
            ),
          ),
          const Divider(height: 32, color: Color(0x00FFFFFF)),
          BotaoPadrao(
              label: "SALVAR CICLO",
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

class RegistrarAplicacao extends StatelessWidget {
  RegistrarAplicacao({Key? key}) : super(key: key);

  final double leftPadding = 32;
  final TextEditingController dtAplicacao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Texto(
              "REGISTRAR",
              size: SizeConfig.of(context).dynamicScaleSize(size: 18),
              color: ArielColors.secundary,
              fontWeight: Weight.bold,
            ),
            Texto(
              " APLICAÇÃO",
              size: SizeConfig.of(context).dynamicScaleSize(size: 18),
              color: ArielColors.secundary,
              fontWeight: Weight.regular,
            ),
          ],
        ),
        const Divider(
          height: 16,
          color: Color(0x00FFFFFF),
        ),
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
            padding: EdgeInsets.all(0),
            textStyle: TextStyle(
                fontSize: SizeConfig.of(context).dynamicScaleSize(size: 12),
                fontWeight: Weight.bold),
            internalPadding: SizeConfig.of(context).dynamicScaleSize(size: 8),
            onPressed: () {}),
      ]),
    );
  }
}
