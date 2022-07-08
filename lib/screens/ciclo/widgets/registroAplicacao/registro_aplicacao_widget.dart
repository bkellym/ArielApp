import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/detalhe/campo_destaque.dart';
import 'package:ariel_app/components/detalhe/campo_detalhe.dart';
import 'package:ariel_app/components/detalhe/detalhe_widget.dart';
import 'package:ariel_app/components/input/campo_data.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/models/ciclo_model.dart';
import 'package:ariel_app/screens/ariel_app.dart';
import 'package:ariel_app/screens/ciclo/widgets/registroAplicacao/registro_widget_bloc.dart';
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
  final double leftPadding = 32;

  @override
  void initState() {
    _bloc.controller.dataAplicacao = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DetalheWidget(
      titulo: "Ciclos",
      subTitulo: const ["registrar", " aplicação"],
      color: ArielColors.secundary,
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
                  leftPadding: leftPadding,
                  color: ArielColors.cicloColor),
              CampoDetalhe(
                titulo: "DOSAGEM",
                valor: widget.model.dosagem,
                leftPadding: 0,
                color: ArielColors.cicloColor,
                lineColor: ArielColors.secundary,
              ),
              Padding(
                padding: EdgeInsets.only(right: leftPadding),
                child: CampoDetalhe(
                  titulo: "qtd por ciclo",
                  valor: widget.model.aplicacoes.length.toString(),
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
                valor: widget.model.dataIncio,
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
            "DATA DA APLICAÇÃO",
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
            controller: _bloc.controller.dataAplicacao,
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
