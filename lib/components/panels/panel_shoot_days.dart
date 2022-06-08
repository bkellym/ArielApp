import 'package:flutter/material.dart';

import 'package:ariel_app/colors.dart';
import 'package:ariel_app/components/cards/card_data_atual.dart';
import 'package:ariel_app/components/cards/card_notifications.dart';

class PanelShootDays extends StatelessWidget {
  const PanelShootDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var next_shoot = DateTime.parse("2022-01-18");
    var days_remaining = next_shoot.difference(now).inDays + 1;
    var dayString = days_remaining > 1 ? " Dias" : " Dia";
    dayString = days_remaining.toString() + dayString;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CardDataAtual(),
              NotificationButton(
                isDark: false,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/next_shoot.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Faltam",
                  style: TextStyle(
                    color: ArielColors.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                  ),
                ),
                Text(
                  dayString,
                  style: const TextStyle(
                    color: ArielColors.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0,
                  ),
                ),
                const Text(
                  "para a sua próxima aplicação",
                  style: TextStyle(
                    color: ArielColors.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
