import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardDataAtual extends StatelessWidget {
  const CardDataAtual({Key? key}) : super(key: key);

//  var now = DateTime.now();

  String getDiaSemana(DateTime data) {
    if (data.weekday == 0) return 'Domingo';
    if (data.weekday == 1) return 'Segunda-feira';
    if (data.weekday == 2) return 'Terça-feira';
    if (data.weekday == 3) return 'Quarta-feira';
    if (data.weekday == 4) return 'Quinta-feira';
    if (data.weekday == 5) return 'Sexta-feira';
    if (data.weekday == 6) return 'Sábado';

    return '';
  }

  String getMesAno(DateTime data) {
    if (data.month == 1) return 'Janeiro ' + data.year.toString();
    if (data.month == 2) return 'Fevereiro ' + data.year.toString();
    if (data.month == 3) return 'Março ' + data.year.toString();
    if (data.month == 4) return 'Abril ' + data.year.toString();
    if (data.month == 5) return 'Maio ' + data.year.toString();
    if (data.month == 6) return 'Junho ' + data.year.toString();
    if (data.month == 7) return 'Julho ' + data.year.toString();
    if (data.month == 8) return 'Agosto ' + data.year.toString();
    if (data.month == 9) return 'Setembro ' + data.year.toString();
    if (data.month == 10) return 'Outubro ' + data.year.toString();
    if (data.month == 11) return 'Novembro ' + data.year.toString();
    if (data.month == 12) return 'Dezembro ' + data.year.toString();

    return '';
  }

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
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    getDiaSemana(now),
                    style: const TextStyle(
                      color: Color(0xFF1B569C),
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    getMesAno(now),
                    style: const TextStyle(
                      color: Color(0xFF1B569C),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
