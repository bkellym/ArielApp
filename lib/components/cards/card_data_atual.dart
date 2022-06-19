import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

import 'package:ariel_app/controller/date_controller.dart';

class CardDataAtual extends StatelessWidget {
  bool isDark;
  CardDataAtual({Key? key, this.isDark = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    return Container(
        height: 64,
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: ArielColors.baseLight,
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
                style: TextStyle(
                  color: ArielColors.baseDark,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    DateController.getDiaSemana(now),
                    style: TextStyle(
                      color: ArielColors.baseDark,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    DateController.getMesAno(now),
                    style: TextStyle(
                      color: ArielColors.baseDark,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
