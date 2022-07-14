import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ciclo/detalhes/detalhe_ciclo_widget.dart';
import 'package:ariel_app/src/ariel_app/ciclo/registroAplicacao/registro_aplicacao_widget.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/consulta/item_consulta.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/exame/item_exame.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/widgets/lista_item.dart';
import 'package:ariel_app/src/ariel_app/inicio/widgets/destaque.dart';
import 'package:ariel_app/src/ariel_app/inicio/widgets/grafico_principal.dart';
import 'package:ariel_app/src/ariel_app/inicio/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                _bloc.ciclo != null
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _bloc.proxAplicacao != null
                              ? GraficoPrincipal(
                                  hormonio: _bloc.ciclo?.medicamento ?? "",
                                  dosagem: _bloc.ciclo?.dosagem ?? "",
                                  proxAplicacao: _bloc.proxAplicacao!,
                                  chartData: _bloc.getCharData(),
                                )
                              : const SizedBox.shrink(),
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.of(context)
                                    .dynamicScaleSize(size: 16),
                                top: SizeConfig.of(context)
                                    .dynamicScaleSize(size: 32)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Destaque(
                                  titulo: "Fase do Ciclo",
                                  valor: _bloc.getFaseCiclo(),
                                ),
                                Destaque(
                                  titulo: "Próxima aplicação",
                                  valor: _bloc.getProxAplic(),
                                ),
                                Destaque(
                                  titulo: "Ultima aplicação",
                                  valor: DateFormat("dd/MM/y", "pt_BR").format(
                                      DateTime.parse(
                                          _bloc.user.dtUltAplicacao ?? "")),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Texto(
                              "VOCÊ AINDA NÃO POSSUI CICLOS CADASTRADOS",
                              color: ArielColors.textLight,
                              fontWeight: Weight.semibold,
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 32)),
                              size: 12,
                            ),
                          ]),
                const Divisoria(),
                DivisoriaDecorada(
                  titulo: "Próximos exames e consultas",
                  cor: ArielColors.secundary,
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.of(context).dynamicScaleSize(size: 8),
                      top: SizeConfig.of(context).dynamicScaleSize(size: 16)),
                ),
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
