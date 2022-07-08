import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/screens/inicio/widgets/data_atual.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String nome;
  final Widget foto;

  const Header({
    Key? key,
    required this.nome,
    required this.foto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFF1CE8B4),
            Color(0xFF1CC2EB),
          ],
        ),
      ),
      child: SizedBox(
        height: SizeConfig.of(context).dynamicScaleSize(size: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ foto,
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texto(
                    nome,
                    size: 18,
                    color: ArielColors.baseLight,
                    fontWeight: Weight.bold,
                  ),
                ],
              ),
            ),
            const Spacer(),
            DataAtual(),
          ],
        ),
      ),
    );
  }
}
