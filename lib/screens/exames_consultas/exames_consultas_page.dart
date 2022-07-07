import 'package:flutter/material.dart';

import 'package:ariel_app/components/FloatingActionCapsule/capsule.dart';
import 'package:ariel_app/components/FloatingActionCapsule/floating_action_capsule.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';


class ExamesConsultasPage extends StatefulWidget {
  const ExamesConsultasPage({Key? key}) : super(key: key);

  @override
  State<ExamesConsultasPage> createState() => _ExamesConsultasPageState();
}

class _ExamesConsultasPageState extends State<ExamesConsultasPage>
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
            iconColor: Color(0xFFFFC153),
            bubbleColor: Colors.white,
            titleStyle: const TextStyle(fontSize: 10, color: Color(0xFFFFC153)),
            onPress: () {
              _animationController.reverse();
            },
          ),
          Capsule(
            icon: Icons.circle,
            title: "NOVA CONSULTA",
            iconColor: Color(0xFF1DC5E9),
            bubbleColor: Colors.white,
            titleStyle: const TextStyle(fontSize: 10, color: Color(0xFF1DC5E9)),
            onPress: () {
              _animationController.reverse();
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
                  image:
                      Image.asset('assets/images/header_exames_consultas.png')
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
                          left:
                              SizeConfig.of(context).dynamicScaleSize(size: 24),
                          bottom:
                              SizeConfig.of(context).dynamicScaleSize(size: 8),
                        ),
                        child: Texto(
                          "EXAMES E\nCONSULTAS",
                          size:
                              SizeConfig.of(context).dynamicScaleSize(size: 26),
                          color: Colors.white,
                          fontWeight: Weight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
