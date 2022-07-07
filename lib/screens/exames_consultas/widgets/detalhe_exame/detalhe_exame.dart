import 'package:ariel_app/components/botoes/botao_texto_icon.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/screens/ariel_app.dart';
import 'package:ariel_app/screens/exames_consultas/widgets/detalhe_exame/detalhe_exame_bloc.dart';
import 'package:flutter/material.dart';

class DetalheExame extends StatefulWidget {
  final int widgetIndex;

  const DetalheExame({Key? key, required this.widgetIndex}) : super(key: key);

  @override
  State<DetalheExame> createState() => _DetalheExameState();
}

class _DetalheExameState extends State<DetalheExame> {
  final DetalheExameBloc _bloc = DetalheExameBloc();
  final double leftPadding = 32;

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
              image: Image.asset('assets/images/exame.png').image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: SizeConfig.of(context).dynamicScaleSize(size: 110),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Texto(
                            "EXAMES E\nCONSULTAS",
                            padding: EdgeInsets.only(
                              left: SizeConfig.of(context).dynamicScaleSize(
                                  size:
                                  MediaQuery.of(context).size.width * 0.1),
                              bottom: SizeConfig.of(context)
                                  .dynamicScaleSize(size: 8),
                            ),
                            size: SizeConfig.of(context)
                                .dynamicScaleSize(size: 26),
                            color: Colors.white,
                            fontWeight: Weight.bold,
                          ),
                        ]),
                  ),
                ],
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
                                builder: (context) => const ArielApp(tela: 2)),
                          )
                        },
                      ),
                    ),
                    FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return _bloc.listWidgets[widget.widgetIndex];
                      },
                    ),
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
