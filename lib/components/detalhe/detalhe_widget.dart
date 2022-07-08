import 'package:ariel_app/components/botoes/botao_texto_icon.dart';
import 'package:ariel_app/components/detalhe/subtitulo.dart';
import 'package:ariel_app/components/detalhe/titulo.dart';
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
      body: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imgFundo,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Titulo(
                titulo,
                fontSize: tituloSize,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
