import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/detalhe/detalhe_widget.dart';
import 'package:ariel_app/components/input/campo_data.dart';
import 'package:ariel_app/components/input/campo_hora.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/models/exame_model.dart';
import 'package:ariel_app/screens/ariel_app.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/exame/cadastro_edicao/cadastro_bloc.dart';
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
              tituloSize: 20,
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
                      controller: _bloc.controller.tipo,
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
                                  "DATA DO EXAME",
                                  color: ArielColors.exameColor,
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
                                  color: ArielColors.exameColor,
                                  controller: _bloc.controller.data,
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
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                  ),
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
                      controller: _bloc.controller.local,
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
                      controller: _bloc.controller.detalhes,
                      maxLines: 3,
                      leftPadding: leftPadding,
                      rightPadding: leftPadding,
                    ),
                    const Divider(height: 32, color: Color(0x00FFFFFF)),
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
