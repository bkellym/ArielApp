import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/shared/floating_action_capsule.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/perfil/conquista/cadastro.dart';
import 'package:ariel_app/src/ariel_app/perfil/editar_perfil/editar_perfil_page.dart';
import 'package:ariel_app/src/ariel_app/perfil/widget/conquista_widget.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  final UserModel user;

  const PerfilPage({Key? key, required this.user}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      floatingActionButton: FloatingActionCapsule(
        iconData: Icons.edit,
        animation: _animation,
        iconColor: Colors.white,
        backGroundColor: ArielColors.cicloColor,
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),
        items: <Capsule>[
          Capsule(
            icon: Icons.person_outline_outlined,
            title: "EDITAR PERFIL",
            iconColor: Colors.white,
            bubbleColor: ArielColors.secundary,
            titleStyle: const TextStyle(fontSize: 10, color: Colors.white),
            onPress: () {
              _animationController.reverse();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditarPerfilPage(
                      user: widget.user,
                    )),
              );
            },
          ),
          Capsule(
            icon: Icons.favorite_border_outlined,
            title: "NOVA CONQUISTA",
            iconColor: Colors.white,
            bubbleColor: ArielColors.secundary,
            titleStyle: const TextStyle(fontSize: 10, color: Colors.white),
            onPress: () {
              _animationController.reverse();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastrarConquistaPage(
                      user: widget.user,
                    )),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Column(children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          Image.asset('assets/images/header_perfil.png').image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SizedBox(
                    height: 90,
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
                              "PERFIL",
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 36),
                              color: Colors.white,
                              fontWeight: Weight.bold,
                            ),
                          ),
                        ]),
                  ),
                ),
              ]),
              DivisoriaDecorada(
                titulo: "SOBRE VOCÊ",
                cor: ArielColors.secundary,
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.of(context).dynamicScaleSize(size: 16),
                ),
              ),
              Center(
                child: Container(
                  height: 192,
                  width: 192,
                  decoration: BoxDecoration(
                    color: ArielColors.baseDark,
                    borderRadius: BorderRadius.circular(8),
                    shape: BoxShape.rectangle,
                  ),
                  child: const Center(
                    child: Icon(Icons.camera_alt),
                  ),
                ),
              ),
              Column(
                children: [
                  Texto(
                    "OLÁ, EU SOU",
                    size: SizeConfig.of(context).dynamicScaleSize(size: 12),
                    fontWeight: Weight.semibold,
                    color: ArielColors.secundary,
                    padding: EdgeInsets.only(
                      top: SizeConfig.of(context).dynamicScaleSize(size: 12),
                      bottom: SizeConfig.of(context).dynamicScaleSize(size: 4),
                    ),
                  ),
                  Texto(
                    widget.user.nome,
                    size: SizeConfig.of(context).dynamicScaleSize(size: 24),
                    fontWeight: Weight.regular,
                    padding: EdgeInsets.only(
                      bottom: SizeConfig.of(context).dynamicScaleSize(size: 12),
                      left: SizeConfig.of(context).dynamicScaleSize(size: 40),
                      right: SizeConfig.of(context).dynamicScaleSize(size: 40),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            SizeConfig.of(context).dynamicScaleSize(size: 40)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Texto(
                              "IDADE",
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 10),
                              fontWeight: Weight.semibold,
                              color: ArielColors.secundary,
                              padding: EdgeInsets.only(
                                  right: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 8)),
                            ),
                            Texto(
                              "25",
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 10),
                              fontWeight: Weight.regular,
                            ),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Texto(
                              "GÊNERO",
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 10),
                              fontWeight: Weight.semibold,
                              color: ArielColors.secundary,
                            ),
                            Texto(
                              "MASCULINO",
                              size: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 10),
                              fontWeight: Weight.regular,
                              padding: EdgeInsets.only(
                                  left: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 8)),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  Texto(
                    "HISTÓRIA",
                    size: SizeConfig.of(context).dynamicScaleSize(size: 12),
                    fontWeight: Weight.semibold,
                    color: ArielColors.secundary,
                    padding: EdgeInsets.only(
                      top: SizeConfig.of(context).dynamicScaleSize(size: 16),
                      bottom: SizeConfig.of(context).dynamicScaleSize(size: 8),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: SizeConfig.of(context).dynamicScaleSize(size: 48),
                      right: SizeConfig.of(context).dynamicScaleSize(size: 48),
                    ),
                    child: Texto(
                      // widget.user.historia!,
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, Lorem ipsumdolor sit amet, consectetuer adipiscing elit, Lorem ipsum dolor sit amet, consectetueradipiscing elit, Lorem ipsumdolor sit amet, consectetuer adipiscing elit,",
                      size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                      textAlign: TextAlign.center,
                      fontWeight: Weight.regular,
                      padding: EdgeInsets.only(
                        bottom:
                            SizeConfig.of(context).dynamicScaleSize(size: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const DivisoriaDecorada(
                titulo: "MINHAS CONQUISTAS",
                cor: ArielColors.secundary,
                padding: EdgeInsets.zero,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.of(context).dynamicScaleSize(size: 24),
                  left: SizeConfig.of(context).dynamicScaleSize(size: 32),
                  right: SizeConfig.of(context).dynamicScaleSize(size: 32),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ConquistaWidget(),
                        ConquistaWidget(),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
