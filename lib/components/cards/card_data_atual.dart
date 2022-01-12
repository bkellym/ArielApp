import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

import 'package:ariel_app/controller/date_controller.dart';

class CardDataAtual extends StatelessWidget {
  const CardDataAtual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    return Container(
        height: 64,
        margin: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: ArielColors.cardBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                now.day.toString(),
                style: const TextStyle(
                  color: ArielColors.primaryDark,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    DateController.getDiaSemana(now),
                    style: const TextStyle(
                      color: ArielColors.primaryDark,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    DateController.getMesAno(now),
                    style: const TextStyle(
                      color: ArielColors.primaryDark,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}