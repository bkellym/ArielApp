import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ariel_app/enums/datas_enums.dart';

class CardDataAtual extends StatelessWidget {
  const CardDataAtual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    return Container(
        height: 64,
        margin: const EdgeInsets.only(left: 16, top: 16),
        decoration: const BoxDecoration(
          color: Color(0xFFE2EDFF),
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
                  color: Color(0xFF1B569C),
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
                    DatasEnums.getDiaSemana(now),
                    style: const TextStyle(
                      color: Color(0xFF1B569C),
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    DatasEnums.getMesAno(now),
                    style: const TextStyle(
                      color: Color(0xFF1B569C),
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
