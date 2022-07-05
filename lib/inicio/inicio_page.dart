import 'package:ariel_app/inicio/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ariel_app/inicio/widgets/data_atual.dart';
import 'package:ariel_app/components/evento.dart';
import 'package:ariel_app/components/menus/menu_navegation.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/inicio/inicio_bloc.dart';
import 'package:ariel_app/inicio/widgets/destaque.dart';
import 'package:ariel_app/inicio/widgets/grafico_principal.dart';
import 'package:ariel_app/models/evento_model.dart';

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final InicioBloc _bloc = InicioBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _bloc.buscarDadosUsuario(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            decoration: const BoxDecoration(
              color: ArielColors.baseLight,
            ),
            child: Column(
              children: [
                Header(
                  nome: _bloc.user?.nome ?? "",
                  foto: _bloc.getFotoUsuario(),
                ),
                Row(
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
                        : SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 32),
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
                                    _bloc.user?.dtUltAplicacao ?? "")),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Evento(
                  evento: EventoModel(
                      titulo: "Próximo Exame",
                      tipo: "Exame de Sangue",
                      data: DateTime.utc(2022, 07, 9),
                      descricao:
                          "Dosagem de T3, dosagem de T4, creatinina, uréia, hemograma completo",
                      cor: 0xFFFFC153),
                ),
                Evento(
                  evento: EventoModel(
                      titulo: "Próxima Consulta",
                      tipo: "Endocrinologista",
                      data: DateTime.utc(2022, 07, 10),
                      descricao: "Dr. Alberto de Sá, Clínica Dionísio Torres",
                      cor: 0xFF1DCBE0),
                ),
                MenuNavegacao(1)
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
