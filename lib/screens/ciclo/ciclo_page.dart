import 'package:ariel_app/components/FloatingActionCapsule/capsule.dart';
import 'package:ariel_app/components/FloatingActionCapsule/floating_action_capsule.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/models/user_model.dart';
import 'package:ariel_app/screens/ciclo/ciclo_bloc.dart';
import 'package:ariel_app/screens/ciclo/widgets/cadastroEdicao/cadastro_edicao_widget.dart';
import 'package:ariel_app/screens/ciclo/widgets/item_ciclo/lista_ciclos.dart';
import 'package:ariel_app/screens/ciclo/widgets/registroAplicacao/registro_aplicacao_widget.dart';
import 'package:flutter/material.dart';

class CicloPage extends StatefulWidget {
  final UserModel user;

  const CicloPage({Key? key, required this.user}) : super(key: key);

  @override
  State<CicloPage> createState() => _CicloPageState();
}

class _CicloPageState extends State<CicloPage>
    with SingleTickerProviderStateMixin {
  final CicloBloc _bloc = CicloBloc();

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
                      title: "NOVO CICLO",
                      iconColor: ArielColors.cicloColor,
                      bubbleColor: Colors.white,
                      titleStyle: const TextStyle(
                          fontSize: 10,
                          color: ArielColors.cicloColor,
                          fontWeight: FontWeight.w700),
                      onPress: () {
                        _animationController.reverse();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CadastroEdicaoCiclo(
                                    userUid: widget.user.uid,
                                  )),
                        );
                      }),
                  Capsule(
                      icon: Icons.circle,
                      title: "REGISTRAR APLICAÇÃO",
                      iconColor: ArielColors.cicloColor,
                      bubbleColor: Colors.white,
                      titleStyle: const TextStyle(
                          fontSize: 10,
                          color: ArielColors.cicloColor,
                          fontWeight: FontWeight.w700),
                      onPress: () {
                        _animationController.reverse();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistroAplicacaoWidget(
                                  model: _bloc.ciclosAtuais.first)),
                        );
                      }),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  Image.asset('assets/images/header_ciclo.png')
                                      .image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: SizedBox(
                            height: SizeConfig.of(context)
                                .dynamicScaleSize(size: 110),
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
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(8),
                            children: [
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
                      ])),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
