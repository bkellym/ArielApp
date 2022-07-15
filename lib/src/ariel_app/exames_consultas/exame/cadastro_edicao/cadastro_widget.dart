import 'package:ariel_app/core/models/exame_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/shared/input/campo_data.dart';
import 'package:ariel_app/core/shared/input/campo_hora.dart';
import 'package:ariel_app/core/shared/input/campo_texto.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ariel_app.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/exame/cadastro_edicao/cadastro_bloc.dart';
import 'package:flutter/material.dart';

class CadastroExameWidget extends StatefulWidget {
  final String userUid;
  final ExameModel? model;

  const CadastroExameWidget({Key? key, required this.userUid, this.model})
      : super(key: key);

  @override
  State<CadastroExameWidget> createState() => _CadastroExameWidgetState();
}

class _CadastroExameWidgetState extends State<CadastroExameWidget> {
  final double leftPadding = 32;
  final ExameBloc _bloc = ExameBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _bloc.init(widget.model),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return DetalheWidget(
              titulo: "Exames \ne Consultas",
              tituloSize: SizeConfig.of(context).dynamicScaleSize(
                size: 20,
              ),
              subTitulo: [
                widget.model == null ? "CADASTRAR" : "EDITAR",
                " EXAME"
              ],
              imgFundo: Image.asset('assets/images/ciclos.png').image,
              color: ArielColors.exameColor,
              child: Material(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CampoTexto(
                      label: "TIPO DE EXAME",
                      color: ArielColors.exameColor,
                      controller: _bloc.controller.tipo,
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
                            child: CampoData(
                              label: "DATA DO EXAME",
                              color: ArielColors.exameColor,
                              controller: _bloc.controller.data,
                              inputPadding: EdgeInsets.only(
                                right: 0,
                                bottom: SizeConfig.of(context).dynamicScaleSize(
                                  size: 8,
                                ),
                              ),
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
                                CampoHora(
                                  controller: _bloc.controller.hora,
                                  color: ArielColors.exameColor,
                                  padding: EdgeInsets.only(
                                    left: 12,
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CampoTexto(
                      label: "LOCAL",
                      color: ArielColors.exameColor,
                      controller: _bloc.controller.local,
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
                    CampoTexto(
                      label: "DETALHES E RECOMENDAÇÕES",
                      color: ArielColors.exameColor,
                      controller: _bloc.controller.detalhes,
                      maxLines: 3,
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
                    const Divisoria(),
                    BotaoPadrao(
                        label: "SALVAR EXAME",
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
                          _bloc.cadastrarEditar(widget.userUid, widget.model);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ArielApp(
                                tela: 2,
                              ),
                            ),
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
