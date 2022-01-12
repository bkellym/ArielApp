import 'package:flutter/material.dart';

import 'package:ariel_app/colors.dart';
import 'package:ariel_app/models/event.dart';
import 'package:ariel_app/components/cards/card_timeline.dart';
import 'package:ariel_app/components/panels/panel_shoot_days.dart';
import 'package:ariel_app/components/menus/menu_navegation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var evento = Event(
      titulo: "Aplicação de Testosterona",
      descricao: "Você definiu essa data, mas pode mudá-la quando desejar.",
      data: DateTime.parse("2022-01-02"),
      dark: true,
      alto: true,
    );

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
              child: const PanelShootDays(),
              height: 280,
              margin: const EdgeInsets.only(top: 8),
              alignment: Alignment.topLeft,
              decoration: const BoxDecoration(
                color: ArielColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
            CardTimeline(item: evento),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      extendBody: true,
      bottomNavigationBar: MenuNavegacao(),
    );
  }
}
