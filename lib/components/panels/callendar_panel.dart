import 'package:flutter/material.dart';

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/components/cards/card_data_atual.dart';
import 'package:ariel_app/components/cards/card_notifications.dart';

class CalendarPanel extends StatelessWidget {
  const CalendarPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              CardDataAtual(isDark: true,),
              NotificationButton(isDark: true,),
            ],
          ),
        ),
      ],
    );
  }
}
