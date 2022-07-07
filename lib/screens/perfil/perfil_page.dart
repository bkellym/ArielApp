import 'package:ariel_app/components/FloatingActionCapsule/capsule.dart';
import 'package:ariel_app/components/FloatingActionCapsule/floating_action_capsule.dart';
import 'package:ariel_app/components/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/screens/perfil/conquista/conquista_widget.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

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
            icon: Icons.circle,
            title: "EDITAR PERFIL",
            iconColor: ArielColors.secundary,
            bubbleColor: Colors.white,
            titleStyle:
                const TextStyle(fontSize: 10, color: ArielColors.secundary),
            onPress: () {
              _animationController.reverse();
            },
          ),
          Capsule(
            icon: Icons.circle,
            title: "REDEFINIR SENHA",
            iconColor: ArielColors.secundary,
            bubbleColor: Colors.white,
            titleStyle:
                const TextStyle(fontSize: 10, color: ArielColors.secundary),
            onPress: () {
              _animationController.reverse();
            },
          ),
          Capsule(
            icon: Icons.circle,
            title: "NOVA CONQUISTA",
            iconColor: ArielColors.secundary,
            bubbleColor: Colors.white,
            titleStyle:
                const TextStyle(fontSize: 10, color: ArielColors.secundary),
            onPress: () {
              _animationController.reverse();
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texto(
                    "SOBRE VOCÊ",
                    size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                    color: ArielColors.secundary,
                    fontWeight: Weight.bold,
                    padding: EdgeInsets.only(
                      top: SizeConfig.of(context).dynamicScaleSize(size: 24),
                      left: SizeConfig.of(context).dynamicScaleSize(size: 24),
                    ),
                  ),
                  const DivisoriaDecorada(cor: ArielColors.secundary),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.of(context).dynamicScaleSize(size: 8),
                  left: SizeConfig.of(context).dynamicScaleSize(
                      size: MediaQuery.of(context).size.width * 0.25),
                  right: SizeConfig.of(context).dynamicScaleSize(
                      size: MediaQuery.of(context).size.width * 0.25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 192,
                        decoration: BoxDecoration(
                          color: ArielColors.baseDark,
                          borderRadius: BorderRadius.circular(16),
                          shape: BoxShape.rectangle,
                        ),
                        child: const Center(
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texto(
                          "NOME",
                          color: ArielColors.secundary,
                          fontWeight: Weight.semibold,
                          size: SizeConfig.of(context).dynamicScaleSize(
                            size: 10,
                          ),
                          padding: EdgeInsets.only(
                            top: SizeConfig.of(context).dynamicScaleSize(
                              size: 16,
                            ),
                          ),
                        ),
                        Texto(
                          "BERNARDO MACIEL",
                          fontWeight: Weight.regular,
                          size: SizeConfig.of(context).dynamicScaleSize(
                            size: 20,
                          ),
                          padding: EdgeInsets.only(
                            top: SizeConfig.of(context).dynamicScaleSize(
                              size: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Texto(
                              "GÊNERO",
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                              size: SizeConfig.of(context).dynamicScaleSize(
                                size: 10,
                              ),
                              padding: EdgeInsets.only(
                                top: SizeConfig.of(context).dynamicScaleSize(
                                  size: 16,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const VerticalDivider(
                                  width: 2,
                                ),
                                SizedBox(
                                    height: SizeConfig.of(context)
                                        .dynamicScaleSize(size: 25),
                                    child: VerticalDivider(
                                        color: ArielColors.secundary,
                                        width: SizeConfig.of(context)
                                            .dynamicScaleSize(size: 0),
                                        thickness: 1)),
                                const VerticalDivider(
                                  width: 8,
                                ),
                                Texto(
                                  "MASCULINO",
                                  fontWeight: Weight.regular,
                                  size: SizeConfig.of(context).dynamicScaleSize(
                                    size: 10,
                                  ),
                                  padding: EdgeInsets.only(
                                    top:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const VerticalDivider(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Texto(
                              "DATA DE NASCIMENTO",
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                              size: SizeConfig.of(context).dynamicScaleSize(
                                size: 10,
                              ),
                              padding: EdgeInsets.only(
                                top: SizeConfig.of(context).dynamicScaleSize(
                                  size: 16,
                                ),
                              ),
                            ),
                            Row(children: [
                              const VerticalDivider(
                                width: 2,
                              ),
                              SizedBox(
                                  height: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 25),
                                  child: VerticalDivider(
                                      color: ArielColors.secundary,
                                      width: SizeConfig.of(context)
                                          .dynamicScaleSize(size: 0),
                                      thickness: 1)),
                              const VerticalDivider(
                                width: 8,
                              ),
                              Texto(
                                "09 DE ABRIL DE 1997",
                                fontWeight: Weight.regular,
                                size: SizeConfig.of(context).dynamicScaleSize(
                                  size: 10,
                                ),
                                padding: EdgeInsets.only(
                                  top: SizeConfig.of(context).dynamicScaleSize(
                                    size: 0,
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texto(
                          "HISTÓRIA",
                          color: ArielColors.secundary,
                          fontWeight: Weight.semibold,
                          size: SizeConfig.of(context).dynamicScaleSize(
                            size: 10,
                          ),
                          padding: EdgeInsets.only(
                            top: SizeConfig.of(context).dynamicScaleSize(
                              size: 16,
                            ),
                          ),
                        ),
                        Row(children: [
                          const VerticalDivider(
                            width: 2,
                          ),
                          SizedBox(
                              height: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 25),
                              child: VerticalDivider(
                                  color: ArielColors.secundary,
                                  width: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 0),
                                  thickness: 1)),
                          const VerticalDivider(
                            width: 8,
                          ),
                          SizedBox(
                            width: SizeConfig.of(context).dynamicScaleSize(
                                size: MediaQuery.of(context).size.width * 0.45),
                            child: Texto(
                              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, Lorem ipsumdolor sit amet, consectetuer adipiscing elit ",
                              fontWeight: Weight.regular,
                              size: SizeConfig.of(context).dynamicScaleSize(
                                size: 10,
                              ),
                              padding: EdgeInsets.only(
                                top: SizeConfig.of(context).dynamicScaleSize(
                                  size: 0,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texto(
                    "MINHAS CONQUISTAS",
                    size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                    color: ArielColors.secundary,
                    fontWeight: Weight.bold,
                    padding: EdgeInsets.only(
                      top: SizeConfig.of(context).dynamicScaleSize(size: 24),
                      left: SizeConfig.of(context).dynamicScaleSize(size: 24),
                    ),
                  ),
                  const DivisoriaDecorada(cor: ArielColors.secundary),
                ],
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
