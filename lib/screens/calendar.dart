import 'package:ariel_app/components/panels/callendar_panel.dart';
import 'package:flutter/material.dart';

import 'package:ariel_app/colors.dart';
import 'package:ariel_app/components/panels/panel_shoot_days.dart';
import 'package:ariel_app/components/menus/menu_navegation.dart';
import 'package:ariel_app/components/panels/timeline.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              ArielColors.primary,
              ArielColors.primaryLight,
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: const CalendarPanel(),
              height: 280,
              margin: const EdgeInsets.only(top: 8),
              alignment: Alignment.topLeft,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: MenuNavegacao(selectedIndex: 1),
    );
  }
}
