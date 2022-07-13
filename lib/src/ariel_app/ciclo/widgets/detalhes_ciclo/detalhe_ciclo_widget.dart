import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/campo_destaque.dart';
import 'package:ariel_app/core/shared/detalhe/campo_detalhe.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/cadastroEdicao/cadastro_edicao_widget.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/detalhes_ciclo/detalhe_ciclo_bloc.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/registroAplicacao/registro_aplicacao_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetalheCicloWidget extends StatefulWidget {
  final CicloModel model;

  const DetalheCicloWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<DetalheCicloWidget> createState() => _DetalheCicloWidgetState();
}

class _DetalheCicloWidgetState extends State<DetalheCicloWidget> {
  final DetalheCicloBloc _bloc = DetalheCicloBloc();

  @override
  Widget build(BuildContext context) {
    final double leftPadding =
        SizeConfig.of(context).dynamicScaleSize(size: 32);

    return DetalheWidget(
        titulo: "Ciclos",
        subTitulo: const ["detalhes", " do ciclo"],
        imgFundo: Image.asset('assets/images/ciclos.png').image,
        color: ArielColors.cicloColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CampoDestaque(
                      titulo: "medicamento",
                      valor: widget.model.medicamento,
                      padding: EdgeInsets.only(left: leftPadding),
                      color: ArielColors.cicloColor,
                    ),
                    CampoDetalhe(
                      titulo: "qtd por ciclo",
                      valor:
                          "${widget.model.statusAplicacoes.length.toString()} ${widget.model.apresentacao}",
                      padding: EdgeInsets.only(left: leftPadding),
                      color: ArielColors.cicloColor,
                      lineColor: ArielColors.cicloColor,
                    ),
                    CampoDetalhe(
                      titulo: "inicio do tratamento",
                      valor: DateFormat("dd/MM/yyyy")
                          .format(DateTime.parse(widget.model.dataIncio))
                          .toString(),
                      padding: EdgeInsets.only(left: leftPadding),
                      color: ArielColors.cicloColor,
                      lineColor: ArielColors.cicloColor,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: SizedBox(
                    height: SizeConfig.of(context).dynamicScaleSize(size: 135),
                    width: SizeConfig.of(context).dynamicScaleSize(size: 160),
                    child: SfCircularChart(
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                          widget: _bloc.getStatusAplicacao(widget.model),
                        ),
                      ],
                      series: <CircularSeries>[
                        DoughnutSeries<double, String>(
                          radius: '100%',
                          innerRadius: '84%',
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                          dataSource: widget.model.statusAplicacoes,
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
                  valor: DateFormat("dd/MM/yyyy")
                      .format(widget.model.aplicacoes.first.data)
                      .toString(),
                  padding: EdgeInsets.only(left: leftPadding),
                  color: ArielColors.cicloColor,
                  lineColor: ArielColors.cicloColor,
                ),
                CampoDetalhe(
                  titulo: "fase atual do ciclo",
                  valor: _bloc.getFaseAplicacao(widget.model),
                  padding: EdgeInsets.only(left: leftPadding),
                  color: ArielColors.cicloColor,
                  lineColor: ArielColors.cicloColor,
                ),
              ],
            ),
            Row(
              children: [
                CampoDetalhe(
                  titulo: "próxima aplicação",
                  valor: _bloc.getProxAplicacao(widget.model) != null
                      ? DateFormat("dd/MM/yyyy").format(
                          _bloc.getProxAplicacao(widget.model) ??
                              DateTime.now())
                      : "Completo",
                  padding: EdgeInsets.only(left: leftPadding),
                  color: ArielColors.cicloColor,
                  lineColor: ArielColors.cicloColor,
                ),
                CampoDetalhe(
                  titulo: "aplicação final",
                  valor: DateFormat("dd/MM/yyyy")
                      .format(widget.model.aplicacoes.last.data),
                  padding: EdgeInsets.only(left: leftPadding),
                  color: ArielColors.cicloColor,
                  lineColor: ArielColors.cicloColor,
                ),
              ],
            ),
            CampoDetalhe(
              titulo: "observações",
              valor: "Heitor, fique atento a sua próxima aplicação.",
              padding: EdgeInsets.only(left: leftPadding),
              color: ArielColors.cicloColor,
              lineColor: ArielColors.cicloColor,
            ),
            const Divisoria(),
            widget.model.atual
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BotaoPadrao(
                        label: "NOVA APLICAÇÃO",
                        height: 40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistroAplicacaoWidget(
                                    model: widget.model)),
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
                                builder: (context) => CadastroEdicaoCiclo(
                                      userUid: widget.model.userUid,
                                      cicloUid: widget.model.uid,
                                      ciclo: widget.model,
                                    )),
                          );
                        },
                        internalPadding: 6,
                        padding: EdgeInsets.only(
                            right: SizeConfig.of(context)
                                .dynamicScaleSize(size: 32)),
                        textStyle: TextStyle(
                            fontSize: SizeConfig.of(context)
                                .dynamicScaleSize(size: 9)),
                      )
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }
}
