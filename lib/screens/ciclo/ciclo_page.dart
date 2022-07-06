import 'package:ariel_app/components/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

import 'widgets/ciclo_widget.dart';

class CicloPage extends StatefulWidget {
  const CicloPage({Key? key}) : super(key: key);

  @override
  State<CicloPage> createState() => _CicloPageState();
}

class _CicloPageState extends State<CicloPage> {
  @override
  Widget build(BuildContext context) {
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
                    image: Image.asset('assets/images/header_ciclo.png').image,
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
                          "CICLOS",
                          size:
                              SizeConfig.of(context).dynamicScaleSize(size: 36),
                          color: Colors.white,
                          fontWeight: Weight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Texto(
                "CICLOS ATIVOS",
                size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                color: ArielColors.cicloColor,
                fontWeight: Weight.bold,
                padding: EdgeInsets.only(
                    top: SizeConfig.of(context).dynamicScaleSize(size: 24),
                    left: SizeConfig.of(context).dynamicScaleSize(size: 24)),
              ),
              const DivisoriaDecorada(cor: ArielColors.cicloColor),
              CicloWidget(),
              Texto(
                "HISTÓRICO DE CICLOS",
                size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                color: ArielColors.cicloColor,
                fontWeight: Weight.bold,
                padding: EdgeInsets.only(
                    top: SizeConfig.of(context).dynamicScaleSize(size: 24),
                    left: SizeConfig.of(context).dynamicScaleSize(size: 24)),
              ),
              const DivisoriaDecorada(cor: ArielColors.cicloColor),
              CicloWidget(),
            ],
          ),
        ),
      ),
    ]);
  }
}
