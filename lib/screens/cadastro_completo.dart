import 'package:ariel_app/components/divisoria_decorada.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:ariel_app/components/grafico_principal.dart';
import 'package:ariel_app/components/data_atual.dart';
import 'package:ariel_app/components/destaque.dart';
import 'package:ariel_app/models/evento_model.dart';
import 'package:ariel_app/components/evento.dart';
import 'package:ariel_app/colors.dart';
import 'package:ariel_app/texto.dart';

import '../components/menus/menu_navegation.dart';

class CadastroCompleto extends StatelessWidget {
  CadastroCompleto({Key? key}) : super(key: key);

  final List<double> chartData = [1, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ArielColors.baseLight,
      ),
      child: Column(
        children: [
          DecoratedBox(
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
              height: 110,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texto.bold(
                          data: "Olá Keller!",
                          size: 22,
                          color: ArielColors.baseLight,
                        ),
                        Texto.semiBold(
                          data: "Vamos Completar seu perfil?".toUpperCase(),
                          size: 12,
                          color: ArielColors.baseLight,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 12,
                ),
                child: Texto.bold(
                  data: "Sobre você",
                  size: 12,
                  color: ArielColors.secundary,
                ),
              ),
              const DivisoriaDecorada(cor: ArielColors.secundary),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: Texto.semiBold(
                  data: "Nome",
                  size: 12,
                  color: ArielColors.secundary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
