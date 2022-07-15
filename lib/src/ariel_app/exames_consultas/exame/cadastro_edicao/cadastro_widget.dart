import 'package:ariel_app/core/models/exame_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/inputs.dart';
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
                      ),
                      CampoData(
                        label: "DATA",
                        color: ArielColors.exameColor,
                        controller: _bloc.controller.data,
                      ),
                      CampoHora(
                        "HORÁRIO DO EXAME",
                        controller: _bloc.controller.hora,
                        color: ArielColors.exameColor,
                      ),
                      CampoTexto(
                        label: "LOCAL",
                        color: ArielColors.exameColor,
                        controller: _bloc.controller.local,
                      ),
                      CampoTexto(
                        label: "OBSERVAÇÕES",
                        color: ArielColors.exameColor,
                        controller: _bloc.controller.detalhes,
                        maxLines: 3,
                      ),
                      const Divisoria(),
                      BotaoPadrao(
                          label: "SALVAR EXAME",
                          height: 40,
                          padding: const EdgeInsets.all(0),
                          textStyle: TextStyle(
                              fontSize: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 12),
                              fontWeight: Weight.bold),
                          internalPadding:
                              SizeConfig.of(context).dynamicScaleSize(size: 4),
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
