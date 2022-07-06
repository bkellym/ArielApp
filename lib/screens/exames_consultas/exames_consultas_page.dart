import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class ExamesConsultasPage extends StatefulWidget {
  const ExamesConsultasPage({Key? key}) : super(key: key);

  @override
  State<ExamesConsultasPage> createState() => _ExamesConsultasPageState();
}

class _ExamesConsultasPageState extends State<ExamesConsultasPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        decoration: const BoxDecoration(
          color: ArielColors.baseLight,
        ),
        child: Expanded(
          child: Column(
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
                          "EXAMES E\nCONSULTAS",
                          size:
                          SizeConfig.of(context).dynamicScaleSize(size: 26),
                          color: Colors.white,
                          fontWeight: Weight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
