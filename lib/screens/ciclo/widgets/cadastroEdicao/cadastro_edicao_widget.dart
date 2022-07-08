import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/detalhe/detalhe_widget.dart';
import 'package:ariel_app/components/input/campo_data.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/models/ciclo_model.dart';
import 'package:ariel_app/screens/ariel_app.dart';
import 'package:ariel_app/screens/ciclo/widgets/cadastroEdicao/cadastro_edicao_bloc.dart';
import 'package:flutter/material.dart';

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
              subTitulo: [
                _bloc.cicloUid == null ? 'cadastrar' : 'Editar',
                ' ciclo'
              ],
              color: ArielColors.secundary,
              child: Material(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      controller: _bloc.controller.medicamento,
                      leftPadding: leftPadding,
                      rightPadding: leftPadding,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: SizeConfig.of(context)
                            .dynamicScaleSize(size: leftPadding),
                        left: SizeConfig.of(context)
                            .dynamicScaleSize(size: leftPadding),
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
                                  size: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 9),
                                  padding: EdgeInsets.only(
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 4,
                                    ),
                                  ),
                                ),
                                CampoData(
                                  controller: _bloc.controller.dataIncio,
                                  padding: EdgeInsets.only(
                                    right: 0,
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
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
                                  size: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 9),
                                  padding: EdgeInsets.only(
                                    left: 12,
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 4,
                                    ),
                                  ),
                                ),
                                CampoTexto(
                                  controller: _bloc.controller.dosagem,
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
                        right: SizeConfig.of(context)
                            .dynamicScaleSize(size: leftPadding),
                        left: SizeConfig.of(context)
                            .dynamicScaleSize(size: leftPadding),
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
                                  size: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 9),
                                  padding: EdgeInsets.only(
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 4,
                                    ),
                                  ),
                                ),
                                CampoTexto(
                                  controller: _bloc.controller.apresentacao,
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
                                  size: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 9),
                                  padding: EdgeInsets.only(
                                    left: 0,
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 4,
                                    ),
                                  ),
                                ),
                                CampoTexto(
                                  controller: _bloc.controller.intervalo,
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
                                  size: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 9),
                                  padding: EdgeInsets.only(
                                    left:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 4,
                                    ),
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 4,
                                    ),
                                  ),
                                ),
                                CampoTexto(
                                  controller: _bloc.controller.numAplicacoes,
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
                      controller: _bloc.controller.dataUltAplicacao,
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
                  ],
                ),
              ),
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
