import 'package:ariel_app/core/inputs.dart';
import 'package:ariel_app/core/models/consulta_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ariel_app.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/consulta/cadastro_edicao/cadastro_edicao_bloc.dart';
import 'package:flutter/material.dart';

class CadastroEdicaoConsulta extends StatefulWidget {
  final String userUid;
  final ConsultaModel? model;

  const CadastroEdicaoConsulta({Key? key, required this.userUid, this.model})
      : super(key: key);

  @override
  State<CadastroEdicaoConsulta> createState() => _CadastroEdicaoConsultaState();
}

class _CadastroEdicaoConsultaState extends State<CadastroEdicaoConsulta> {
  final ConsultaBloc _bloc = ConsultaBloc();

  final double leftPadding = 32;
  final TextEditingController dtInicio = TextEditingController();
  final TextEditingController dtUltimaAplicacao = TextEditingController();

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
                widget.model == null ? "NOVA" : "EDITAR",
                " CONSULTA"
              ],
              imgFundo: Image.asset('assets/images/ciclos.png').image,
              color: ArielColors.consultaColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CampoTexto(
                    label: "TIPO DE CONSULTA",
                    color: ArielColors.consultaColor,
                    controller: _bloc.controller.especialidade,
                  ),
                  CampoTexto(
                    label: "PROFISSIONAL",
                    color: ArielColors.consultaColor,
                    controller: _bloc.controller.medico,
                  ),
                  CampoData(
                    label: "DATA",
                    color: ArielColors.consultaColor,
                    controller: _bloc.controller.data,
                  ),
                  CampoHora(
                    "HORA",
                    color: ArielColors.consultaColor,
                    controller: _bloc.controller.hora,
                  ),
                  CampoTexto(
                    label: "LOCAL",
                    color: ArielColors.consultaColor,
                    controller: _bloc.controller.endereco,
                  ),
                  CampoTexto(
                    label: "RECOMENDAÇÕES",
                    maxLines: 3,
                    color: ArielColors.consultaColor,
                    controller: _bloc.controller.detalhes,
                  ),
                  const Divisoria(),
                  BotaoPadrao(
                      label: "SALVAR CONSULTA",
                      height: SizeConfig.of(context).dynamicScaleSize(size: 40),
                      padding: const EdgeInsets.all(0),
                      textStyle: TextStyle(
                          fontSize:
                              SizeConfig.of(context).dynamicScaleSize(size: 12),
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
