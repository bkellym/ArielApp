import 'package:ariel_app/core/shared/botoes/botao_texto_icon.dart';
import 'package:ariel_app/core/shared/detalhe/subtitulo.dart';
import 'package:ariel_app/core/shared/detalhe/titulo.dart';
import 'package:flutter/material.dart';

class DetalheWidget extends StatelessWidget {
  final String titulo;
  final List<String> subTitulo;
  final Color color;
  final Widget child;
  final double leftPadding = 32;
  final double? tituloSize;
  final ImageProvider imgFundo;

  const DetalheWidget({
    Key? key,
    required this.titulo,
    required this.child,
    required this.subTitulo,
    required this.color,
    required this.imgFundo,
    this.tituloSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: imgFundo, fit: BoxFit.fill)),
        ),
        SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Titulo(
                  titulo,
                  fontSize: tituloSize,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BotaoTextoIcon(
                              icon: Icons.arrow_back_ios_new_rounded,
                              label: "VOLTAR",
                              onPressed: () => Navigator.pop(context)),
                          Subtitulo(subTitulo, color: color),
                          child,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
