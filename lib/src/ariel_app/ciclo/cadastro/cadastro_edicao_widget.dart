import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ariel_app.dart';
import 'package:ariel_app/src/ariel_app/ciclo/cadastro/cadastro_edicao_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ariel_app/core/inputs.dart';

class CadastroEdicaoCiclo extends StatefulWidget {
  final String userUid;
  final String? cicloUid;
  final CicloModel? ciclo;

  const CadastroEdicaoCiclo(
      {Key? key, required this.userUid, this.cicloUid, this.ciclo})
      : super(key: key);

  @override
  CadastroEdicaoCicloState createState() => CadastroEdicaoCicloState();
}

class CadastroEdicaoCicloState extends State<CadastroEdicaoCiclo> {
  final CadastroEdicaobloc _bloc = CadastroEdicaobloc();
  final double leftPadding = 32;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _bloc.init(widget.userUid, widget.cicloUid, widget.ciclo),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return DetalheWidget(
              titulo: "Ciclos",
              subTitulo: [_bloc.cicloUid == null ? 'novo' : 'Editar', ' ciclo'],
              color: ArielColors.cicloColor,
              imgFundo: Image.asset('assets/images/ciclos.png').image,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CampoTexto(
                      label: "MEDICAMENTO",
                      color: ArielColors.cicloColor,
                      controller: _bloc.controller.medicamento,
                    ),
                    CampoTexto(
                      label: 'DOSAGEM',
                      color: ArielColors.cicloColor,
                      textInputType: TextInputType.number,
                      controller: _bloc.controller.dosagem,
                    ),
                    CampoTexto(
                      label: 'APRESENTAÇÃO',
                      color: ArielColors.cicloColor,
                      textInputType: TextInputType.number,
                      controller: _bloc.controller.apresentacao,
                    ),
                    const DivisoriaDecorada(
                      titulo: 'Sobre o Ciclo',
                      cor: ArielColors.cicloColor,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    CampoData(
                      label: "INÍCIO DO TRATAMENTO",
                      color: ArielColors.cicloColor,
                      controller: _bloc.controller.dataIncio,
                    ),
                    CampoTexto(
                      label: 'DOSES TOTAIS DO CICLO',
                      color: ArielColors.cicloColor,
                      textInputType: TextInputType.number,
                      controller: _bloc.controller.numAplicacoes,
                    ),
                    CampoTexto(
                      label: "INTERVALO DO CICLO",
                      color: ArielColors.cicloColor,
                      controller: _bloc.controller.intervalo,
                    ),
                    CampoData(
                      label: "DATA DA ULTIMA DOSE",
                      color: ArielColors.cicloColor,
                      controller: _bloc.controller.dataUltAplicacao,
                    ),
                    const Divisoria(),
                    BotaoPadrao(
                        label: "SALVAR ALTERAÇÕES",
                        height:
                            SizeConfig.of(context).dynamicScaleSize(size: 40),
                        padding: const EdgeInsets.all(0),
                        textStyle: TextStyle(
                            fontSize: SizeConfig.of(context)
                                .dynamicScaleSize(size: 12),
                            fontWeight: Weight.bold),
                        internalPadding:
                            SizeConfig.of(context).dynamicScaleSize(size: 8),
                        onPressed: () {
                          _bloc.cadastrarEditar(widget.ciclo);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ArielApp(
                                      tela: 1,
                                    )),
                          );
                        }),
                  ]),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: ArielColors.cicloColor,
              ),
            );
          }
        });
  }
}
