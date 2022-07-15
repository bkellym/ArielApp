import 'package:ariel_app/core/ariel_icons_icons.dart';
import 'package:ariel_app/core/grafico/grafico_ciclo.dart';
import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ciclo/detalhes/detalhe_ciclo_widget.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/widgets/lista_item.dart';
import 'package:ariel_app/src/ariel_app/inicio/widgets/header.dart';
import 'package:flutter/material.dart';

import 'inicio_bloc.dart';

class InicioPage extends StatefulWidget {
  final UserModel user;

  const InicioPage({Key? key, required this.user}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final InicioBloc _bloc = InicioBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _bloc.buscarDadosUsuario(widget.user),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            decoration: const BoxDecoration(
              color: ArielColors.baseLight,
            ),
            child: Column(
              children: [
                Header(
                  nome: _bloc.user.nome,
                  foto: _bloc.getFotoUsuario(),
                ),
                Column(
                  children: [
                    GraficoCiclo(
                      ciclo: _bloc.ciclo,
                      size: MediaQuery.of(context).size.width * 0.65,
                      chartData: _bloc.getCharData(),
                      onPressed: () {
                        print("onPressed");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalheCicloWidget(
                                    model: _bloc.ciclo!,
                                  )),
                        );
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      ArielIcons.aplicacao,
                                      color: ArielColors.cicloColor,
                                    ),
                                    Texto(
                                      "${_bloc.ciclo?.medicamento} ${_bloc.ciclo?.dosagem}",
                                      fontWeight: Weight.bold,
                                      size: SizeConfig.of(context)
                                          .dynamicScaleSize(size: 10),
                                      padding: EdgeInsets.only(
                                        left: SizeConfig.of(context)
                                            .dynamicScaleSize(size: 8),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 12)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Texto(
                                      "CICLO",
                                      color: ArielColors.cicloColor,
                                      fontWeight: Weight.bold,
                                      size: SizeConfig.of(context)
                                          .dynamicScaleSize(size: 10),
                                    ),
                                    Texto(
                                      _bloc.getFaseCiclo(),
                                      fontWeight: Weight.regular,
                                      size: SizeConfig.of(context)
                                          .dynamicScaleSize(size: 10),
                                      padding: EdgeInsets.only(
                                        left: SizeConfig.of(context)
                                            .dynamicScaleSize(size: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Texto(
                                        "PRÓXIMA DOSE",
                                        color: ArielColors.cicloColor,
                                        fontWeight: Weight.bold,
                                        size: SizeConfig.of(context)
                                            .dynamicScaleSize(size: 10),
                                      ),
                                      Texto(
                                        _bloc.getProxAplic(),
                                        fontWeight: Weight.regular,
                                        size: SizeConfig.of(context)
                                            .dynamicScaleSize(size: 10),
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.of(context)
                                                .dynamicScaleSize(size: 8)),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 12)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Texto(
                                        "ULTIMA DOSE TOMADA",
                                        color: ArielColors.cicloColor,
                                        fontWeight: Weight.bold,
                                        size: SizeConfig.of(context)
                                            .dynamicScaleSize(size: 10),
                                      ),
                                      Texto(
                                        _bloc.getUltAplic(),
                                        fontWeight: Weight.regular,
                                        size: SizeConfig.of(context)
                                            .dynamicScaleSize(size: 10),
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.of(context)
                                                .dynamicScaleSize(size: 8)),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                DivisoriaDecorada(
                    titulo: "Próximos exames e consultas",
                    cor: ArielColors.secundary,
                    padding: EdgeInsets.only(
                      top: SizeConfig.of(context).dynamicScaleSize(size: 24),
                      bottom: SizeConfig.of(context).dynamicScaleSize(size: 8),
                    )),
                _bloc.exame != null && _bloc.consulta != null
                    ? Column(
                        children: [
                          _bloc.exame != null
                              ? ItemWidget(
                                  model: _bloc.exame!,
                                  titulo: _bloc.exame?.tipo ?? "",
                                  color: ArielColors.exameColor,
                                  background: ArielColors.exameFundoColor,
                                  data: _bloc.exame?.dataHora ?? DateTime.now(),
                                  iconColor: ArielColors.exameColor)
                              : const SizedBox.shrink(),
                          _bloc.consulta != null
                              ? ItemWidget(
                                  model: _bloc.consulta!,
                                  titulo: _bloc.consulta?.especialidade ?? "",
                                  color: ArielColors.consultaColor,
                                  background: ArielColors.consultaFundoColor,
                                  data: _bloc.consulta?.dataHora ??
                                      DateTime.now(),
                                  iconColor: ArielColors.consultaColor)
                              : const SizedBox.shrink(),
                        ],
                      )
                    : Row(
                        children: [
                          const Icon(
                            Icons.bookmarks_outlined,
                            color: ArielColors.secundary,
                          ),
                          Texto("Nenhum exame ou consulta castrado no momento",
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 11))
                        ],
                      ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
