import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/campo_destaque.dart';
import 'package:ariel_app/core/shared/detalhe/campo_detalhe.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/shared/input/campo_data.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ariel_app.dart';
import 'package:ariel_app/src/ariel_app/ciclo/registroAplicacao/registro_widget_bloc.dart';
import 'package:flutter/material.dart';

class RegistroAplicacaoWidget extends StatefulWidget {
  final CicloModel model;

  const RegistroAplicacaoWidget({Key? key, required this.model})
      : super(key: key);

  @override
  RegistroAplicacaoWidgetState createState() => RegistroAplicacaoWidgetState();
}

class RegistroAplicacaoWidgetState extends State<RegistroAplicacaoWidget> {
  final RegistroAplicacaoBloc _bloc = RegistroAplicacaoBloc();

  @override
  void initState() {
    _bloc.controller.dataAplicacao = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double leftPadding =
        SizeConfig.of(context).dynamicScaleSize(size: 32);

    return DetalheWidget(
      titulo: "Ciclos",
      subTitulo: const ["registrar", " aplicação"],
      imgFundo: Image.asset('assets/images/ciclos.png').image,
      color: ArielColors.cicloColor,
      child: Material(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CampoDestaque(
                  titulo: "medicamento",
                  valor: widget.model.medicamento,
                  padding: EdgeInsets.only(left: leftPadding),
                  color: ArielColors.cicloColor),
              CampoDetalhe(
                titulo: "DOSAGEM",
                valor: widget.model.dosagem,
                color: ArielColors.cicloColor,
                lineColor: ArielColors.cicloColor,
              ),
              Padding(
                padding: EdgeInsets.only(right: leftPadding),
                child: CampoDetalhe(
                  titulo: "qtd por ciclo",
                  valor: widget.model.aplicacoes.length.toString(),
                  color: ArielColors.cicloColor,
                  lineColor: ArielColors.cicloColor,
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
                valor: widget.model.dataIncio,
                padding: EdgeInsets.only(left: leftPadding),
                color: ArielColors.cicloColor,
                lineColor: ArielColors.cicloColor,
              ),
              Padding(
                padding: EdgeInsets.only(right: leftPadding),
                child: const CampoDetalhe(
                  titulo: "fase atual do ciclo",
                  valor: "Testando",
                  padding: EdgeInsets.only(left: 0, bottom: 4),
                  color: ArielColors.cicloColor,
                  lineColor: ArielColors.cicloColor,
                ),
              ),
            ],
          ),
          CampoData(
            label: "DATA DA APLICAÇÃO",
            controller: _bloc.controller.dataAplicacao,
            color: ArielColors.cicloColor,
            inputPadding: EdgeInsets.only(
              left: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
              right: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
              bottom: SizeConfig.of(context).dynamicScaleSize(size: 8),
            ),
          ),
          BotaoPadrao(
              label: "SALVAR APLICAÇÃO",
              height: SizeConfig.of(context).dynamicScaleSize(size: 40),
              padding: const EdgeInsets.all(0),
              textStyle: TextStyle(
                  fontSize: SizeConfig.of(context).dynamicScaleSize(size: 12),
                  fontWeight: Weight.bold),
              internalPadding: SizeConfig.of(context).dynamicScaleSize(size: 8),
              onPressed: () {
                _bloc.registrar(widget.model);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ArielApp(
                            tela: 1,
                          )),
                );
              }),
        ]),
      ),
    );
  }
}
