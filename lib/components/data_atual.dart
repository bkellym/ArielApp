import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ariel_app/texto.dart';
import 'package:ariel_app/colors.dart';

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
                child: Texto.semiBold(
                  data: now.day.toString(),
                  size: 34,
                  color: ArielColors.baseLight,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texto.bold(
                    data: DateFormat("MMMM", "pt_BR").format(now).toUpperCase(),
                    size: 19,
                    color: ArielColors.baseLight,
                  ),
                  Texto.semiBold(
                    data: DateFormat("EEEE | y", "pt_BR")
                        .format(now)
                        .toUpperCase(),
                    size: 9,
                    color: ArielColors.baseLight,
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
