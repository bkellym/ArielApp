import 'package:ariel_app/core/ariel_icons_icons.dart';
import 'package:ariel_app/core/grafico/grafico_ciclo.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/campo_detalhe_novo.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ciclo/cadastro//cadastro_edicao_widget.dart';
import 'package:ariel_app/src/ariel_app/ciclo/detalhes//detalhe_ciclo_bloc.dart';
import 'package:ariel_app/src/ariel_app/ciclo/registroAplicacao/registro_aplicacao_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            Center(
              child: GraficoCiclo(
                  ciclo: widget.model,
                  chartData: widget.model.statusAplicacoes,
                  size: MediaQuery.of(context).size.width * 0.4),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.of(context).dynamicScaleSize(size: 16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    ArielIcons.aplicacao,
                    color: ArielColors.cicloColor,
                  ),
                  Texto(
                    "${widget.model.medicamento} ${widget.model.dosagem}",
                    size: SizeConfig.of(context).dynamicScaleSize(size: 12),
                    fontWeight: Weight.bold,
                    padding: EdgeInsets.only(
                        left: SizeConfig.of(context).dynamicScaleSize(size: 8)),
                  )
                ],
              ),
            ),
            DivisoriaDecorada(
              titulo: 'Sobre o ciclo',
              cor: ArielColors.cicloColor,
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.of(context).dynamicScaleSize(size: 16)),
            ),
            CampoDetalhe(
              titulo: "medicamento",
              valor: widget.model.medicamento,
              color: ArielColors.cicloColor,
            ),
            CampoDetalhe(
              titulo: "DOSES TOTAIS DO CICLO",
              valor:
                  "${widget.model.statusAplicacoes.length.toString()} ${widget.model.apresentacao}",
              color: ArielColors.cicloColor,
            ),
            CampoDetalhe(
              titulo: "fase atual do ciclo",
              valor: _bloc.getFaseAplicacao(widget.model),
              color: ArielColors.cicloColor,
            ),
            CampoDetalhe(
              titulo: "data da ultima dose",
              valor: _bloc.getUltAplicacao(widget.model) != null
                  ? DateFormat("dd/MM/yyyy").format(
                      _bloc.getUltAplicacao(widget.model) ?? DateTime.now())
                  : "Completo",
              color: ArielColors.cicloColor,
            ),
            CampoDetalhe(
              titulo: "data da próxima dose",
              valor: _bloc.getProxAplicacao(widget.model) != null
                  ? DateFormat("dd/MM/yyyy").format(
                      _bloc.getProxAplicacao(widget.model) ?? DateTime.now())
                  : "Completo",
              color: ArielColors.cicloColor,
            ),
            const Divisoria(),
            widget.model.atual
                ? Row(
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BotaoPadrao(
                            label: "NOVA DOSE",
                            height: SizeConfig.of(context)
                                .dynamicScaleSize(size: 40),
                            padding: const EdgeInsets.all(0),
                            textStyle: TextStyle(
                                fontSize: SizeConfig.of(context)
                                    .dynamicScaleSize(size: 11),
                                fontWeight: Weight.bold),
                            internalPadding: SizeConfig.of(context)
                                .dynamicScaleSize(size: 8),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistroAplicacaoWidget(
                                            model: widget.model)),
                              );
                            },
                          ),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BotaoPadrao(
                            label: "EDITAR CICLO",
                            height: SizeConfig.of(context)
                                .dynamicScaleSize(size: 40),
                            padding: const EdgeInsets.all(0),
                            textStyle: TextStyle(
                                fontSize: SizeConfig.of(context)
                                    .dynamicScaleSize(size: 11),
                                fontWeight: Weight.bold),
                            internalPadding: SizeConfig.of(context)
                                .dynamicScaleSize(size: 8),
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
                          )
                        ],
                      )),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }
}
