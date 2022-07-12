import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class ConquistaWidget extends StatelessWidget {
  const ConquistaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeConfig.of(context).dynamicScaleSize(size: 32),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: ArielColors.secundary, width: 1, style: BorderStyle.solid),
        ),
        child: SizedBox(
          width: SizeConfig.of(context).dynamicScaleSize(size: 152),
          height: SizeConfig.of(context).dynamicScaleSize(size: 72),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    color: ArielColors.secundary,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.of(context).dynamicScaleSize(size: 4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texto(
                          "08",
                          size: 22,
                          fontWeight: Weight.semibold,
                          color: Colors.white,
                        ),
                        Texto(
                          "JUN",
                          size: 7,
                          fontWeight: Weight.bold,
                          color: Colors.white,
                        ),
                        Texto(
                          "QUA",
                          size: 6,
                          fontWeight: Weight.semibold,
                          color: Colors.white,
                        ),
                        Texto(
                          "2022",
                          size: 6,
                          fontWeight: Weight.semibold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        image: DecorationImage(
                          image: Image.asset('assets/images/foto.jpg').image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container())),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.of(context).dynamicScaleSize(size: 8),
                    left: SizeConfig.of(context).dynamicScaleSize(size: 8),
                    right: SizeConfig.of(context).dynamicScaleSize(size: 8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Texto(
                        "MUDEI MEU NOME SOCIAL",
                        size: 9,
                        fontWeight: Weight.bold,
                        color: ArielColors.secundary,
                      ),
                      Texto(
                        "Foi um dia incrível",
                        size: 9,
                        fontWeight: Weight.regular,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
