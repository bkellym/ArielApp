import 'package:ariel_app/components/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/models/user_model.dart';
import 'package:ariel_app/screens/ciclo/ciclo_bloc.dart';
import 'package:ariel_app/screens/ciclo/widgets/lista_ciclos.dart';
import 'package:flutter/material.dart';

import 'widgets/ciclo_widget.dart';

class CicloPage extends StatefulWidget {
  final UserModel user;

  const CicloPage({Key? key, required this.user}) : super(key: key);

  @override
  State<CicloPage> createState() => _CicloPageState();
}

class _CicloPageState extends State<CicloPage> {
  final CicloBloc _bloc = CicloBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _bloc.buscarDados(widget.user.uid),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.asset('assets/images/header_ciclo.png')
                                .image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SizedBox(
                          height: 110,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 24),
                                  bottom: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 8),
                                ),
                                child: Texto(
                                  "CICLOS",
                                  size: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 36),
                                  color: Colors.white,
                                  fontWeight: Weight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _bloc.ciclosAtuais.isNotEmpty
                          ? ListaCiclos(
                              titulo: "ciclos ativos",
                              lista: _bloc.ciclosAtuais,
                            )
                          : const SizedBox.shrink(),
                      _bloc.historicoCiclos.isNotEmpty
                          ? ListaCiclos(
                              titulo: "Histórico de ciclos",
                              lista: _bloc.historicoCiclos,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
