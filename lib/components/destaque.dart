import 'package:flutter/material.dart';

import 'package:ariel_app/core/util/colors.dart';

class Destaque extends StatelessWidget {
  final String titulo;
  final String valor;

  const Destaque({
    Key? key,
    required this.titulo,
    required this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 11,
              color: ArielColors.arielGreen,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              const Text(
                "| ",
                style: TextStyle(
                  fontSize: 16,
                  color: ArielColors.arielGreen,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                valor,
                style: const TextStyle(
                  fontSize: 12,
                  color: ArielColors.textPrimary,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
