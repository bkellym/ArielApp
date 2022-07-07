import 'package:ariel_app/components/botoes/botao_texto_icon.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/screens/ariel_app.dart';
import 'package:flutter/material.dart';

class Detalhe extends StatelessWidget {
  final int widgetIndex;
  final List<Widget> listWidgets;
  final double leftPadding = 32;

  const Detalhe({
    Key? key,
    required this.widgetIndex,
    required this.listWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xFF1CE8B4),
                Color(0xFF1CC2EB),
              ],
            ),
            image: DecorationImage(
              image: Image.asset('assets/images/ciclos.png').image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.of(context).dynamicScaleSize(size: 110),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Texto(
                    "CICLOS",
                    padding: EdgeInsets.only(
                      left: SizeConfig.of(context).dynamicScaleSize(
                          size: MediaQuery.of(context).size.width * 0.1),
                      bottom: SizeConfig.of(context).dynamicScaleSize(size: 8),
                    ),
                    size: SizeConfig.of(context).dynamicScaleSize(size: 36),
                    color: Colors.white,
                    fontWeight: Weight.bold,
                  ),
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: BotaoTextoIcon(
                        icon: Icons.arrow_back_ios_new_rounded,
                        label: "VOLTAR",
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ArielApp(tela: 1)),
                          )
                        },
                      ),
                    ),
                    listWidgets[widgetIndex],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
