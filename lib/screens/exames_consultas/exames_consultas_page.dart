import 'package:ariel_app/components/FloatingActionCapsule/capsule.dart';
import 'package:ariel_app/components/FloatingActionCapsule/floating_action_capsule.dart';
import 'package:ariel_app/components/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/models/user_model.dart';
import 'package:ariel_app/screens/exames_consultas/exames_consultas_bloc.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/consulta/cadastro_edicao/cadastro_edicao_widget.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/consulta/item_consulta.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/exame/cadastro_edicao/cadastro_widget.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/exame/item_exame.dart';
import 'package:flutter/material.dart';

class ExamesConsultasPage extends StatefulWidget {
  final UserModel user;

  const ExamesConsultasPage({Key? key, required this.user}) : super(key: key);

  @override
  State<ExamesConsultasPage> createState() => _ExamesConsultasPageState();
}

class _ExamesConsultasPageState extends State<ExamesConsultasPage>
    with SingleTickerProviderStateMixin {
  final ExameConsultaBloc _bloc = ExameConsultaBloc();
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 260),
      vsync: this,
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _bloc.buscarDados(widget.user.uid),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              floatingActionButton: FloatingActionCapsule(
                iconData: Icons.add,
                animation: _animation,
                iconColor: Colors.white,
                backGroundColor: ArielColors.cicloColor,
                onPress: () => _animationController.isCompleted
                    ? _animationController.reverse()
                    : _animationController.forward(),
                items: <Capsule>[
                  Capsule(
                      icon: Icons.circle,
                      title: "NOVO EXAME",
                      iconColor: ArielColors.exameColor,
                      bubbleColor: Colors.white,
                      titleStyle: const TextStyle(
                          fontSize: 10, color: ArielColors.exameColor),
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroExameWidget(
                                      userUid: widget.user.uid,
                                    )));
                      }),
                  Capsule(
                    icon: Icons.circle,
                    title: "NOVA CONSULTA",
                    iconColor: ArielColors.consultaColor,
                    bubbleColor: Colors.white,
                    titleStyle: const TextStyle(
                        fontSize: 10, color: ArielColors.consultaColor),
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CadastroEdicaoConsulta(
                                  userUid: widget.user.uid)));
                    },
                  ),
                ],
              ),
              body: Column(children: [
                Expanded(
                  child: Column(children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.asset(
                                  'assets/images/header_exames_consultas.png')
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
                                  "EXAMES E\nCONSULTAS",
                                  size: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 26),
                                  color: Colors.white,
                                  fontWeight: Weight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Texto(
                            "EXAMES",
                            size: SizeConfig.of(context)
                                .dynamicScaleSize(size: 11),
                            color: ArielColors.exameColor,
                            fontWeight: Weight.bold,
                            padding: EdgeInsets.only(
                                left: SizeConfig.of(context)
                                    .dynamicScaleSize(size: 24)),
                          ),
                          const DivisoriaDecorada(cor: ArielColors.exameColor),
                          Column(
                            children: _bloc.listaExames
                                .map((item) => ItemExameWidget(
                                      model: item,
                                    ))
                                .toList(),
                          ),
                          const Divider(height: 24, color: Colors.transparent),
                          Texto(
                            "CONSULTAS",
                            size: SizeConfig.of(context)
                                .dynamicScaleSize(size: 11),
                            color: ArielColors.consultaColor,
                            fontWeight: Weight.bold,
                            padding: EdgeInsets.only(
                                left: SizeConfig.of(context)
                                    .dynamicScaleSize(size: 24)),
                          ),
                          const DivisoriaDecorada(
                              cor: ArielColors.consultaColor),
                          Column(
                            children: _bloc.listaConsultas
                                .map((item) => ItemConsultaWidget(
                              model: item,
                            ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
