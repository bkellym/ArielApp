import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Column(children: [
            DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('assets/images/header_perfil.png').image,
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
                          "PERFIL",
                          size:
                              SizeConfig.of(context).dynamicScaleSize(size: 36),
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
