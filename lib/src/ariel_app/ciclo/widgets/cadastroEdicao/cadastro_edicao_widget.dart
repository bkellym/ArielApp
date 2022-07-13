import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/shared/input/campo_data.dart';
import 'package:ariel_app/core/shared/input/campo_texto.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ariel_app.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/cadastroEdicao/cadastro_edicao_bloc.dart';
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
              color: ArielColors.cicloColor,
              imgFundo: Image.asset('assets/images/ciclos.png').image,
              child: Material(
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CampoTexto(
                        label: "MEDICAMENTO UTILIZADO",
                        controller: _bloc.controller.medicamento,
                        color: ArielColors.cicloColor,
                        inputPadding: EdgeInsets.only(
                          right: SizeConfig.of(context).dynamicScaleSize(
                            size: leftPadding,
                          ),
                          left: SizeConfig.of(context).dynamicScaleSize(
                            size: leftPadding,
                          ),
                          bottom: SizeConfig.of(context).dynamicScaleSize(
                            size: 12,
                          ),
                        ),
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
                                      color: ArielColors.cicloColor,
                                      fontWeight: Weight.semibold,
                                      size: SizeConfig.of(context)
                                          .dynamicScaleSize(size: 9),
                                      padding: EdgeInsets.only(
                                        bottom: SizeConfig.of(context)
                                            .dynamicScaleSize(
                                          size: 4,
                                        ),
                                      ),
                                    ),
                                    CampoData(
                                      controller: _bloc.controller.dataIncio,
                                      padding: EdgeInsets.only(
                                        right: 0,
                                        bottom: SizeConfig.of(context)
                                            .dynamicScaleSize(
                                          size: 8,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: CampoTexto(
                                  label: 'DOSAGEM',
                                  color: ArielColors.cicloColor,
                                  controller: _bloc.controller.dosagem,
                                  inputPadding: const EdgeInsets.only(
                                      right: 0, left: 12, bottom: 8),
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ]),
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
                                child: CampoTexto(
                                  label: 'APRESENTAÇÃO',
                                  color: ArielColors.cicloColor,
                                  controller: _bloc.controller.apresentacao,
                                  inputPadding:
                                      const EdgeInsets.only(left: 0, right: 12),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: CampoTexto(
                                  label: "INTERVALO",
                                  color: ArielColors.cicloColor,
                                  controller: _bloc.controller.intervalo,
                                  inputPadding: const EdgeInsets.only(
                                      left: 0, right: 8, bottom: 12),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: CampoTexto(
                                  label: 'QTD. POR CICLO',
                                  color: ArielColors.cicloColor,
                                  controller: _bloc.controller.numAplicacoes,
                                  inputPadding: const EdgeInsets.only(
                                      left: 4, right: 0, bottom: 12),
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ]),
                      ),
                      Texto(
                        "DATA DA ULTIMA APLICAÇÃO",
                        color: ArielColors.cicloColor,
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
