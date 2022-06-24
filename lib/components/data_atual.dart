import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/core/util/colors.dart';

class DataAtual extends StatelessWidget {
  final DateTime now = DateTime.now();

  DataAtual({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        bottom: 18,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Texto(
                  now.day.toString(),
                  size: 32,
                  color: ArielColors.baseLight,
                  fontWeight: Weight.semibold,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Texto(
                    DateFormat("MMMM", "pt_BR").format(now).toUpperCase(),
                    size: 19,
                    color: ArielColors.baseLight,
                    fontWeight: Weight.bold,
                  ),
                  Texto(
                    DateFormat("E | y", "pt_BR").format(now).toUpperCase(),
                    size: 9,
                    color: ArielColors.baseLight,
                    fontWeight: Weight.semibold,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
