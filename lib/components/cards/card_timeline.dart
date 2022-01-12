import 'package:flutter/material.dart';

import 'package:ariel_app/models/event.dart';
import 'package:ariel_app/controller/date_controller.dart';

class CardTimeline extends StatelessWidget {
  final Event item;

  const CardTimeline({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12, left: 4, right: 4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      elevation: 8,
      child: ListTile(
        leading: Column(
          children: [
            Text(
              item.data.day.toString(),
              style: TextStyle(
                color: item.dark ? Colors.white : const Color(0xFF1B569C),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              DateController.getMesAbreviado(item.data),
              style: TextStyle(
                color: item.dark ? Colors.white : const Color(0xFF1B569C),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
        title: Text(
          item.titulo,
          style: TextStyle(
            color: item.dark ? Colors.white : const Color(0xFF1B569C),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          item.descricao,
          style: TextStyle(
            color: item.dark ? Colors.white : const Color(0xFF656565),
            fontSize: 12,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: item.dark ? Colors.white : const Color(0xFF1B569C),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        isThreeLine: item.alto,
        tileColor:
        item.dark ? const Color(0xFF1B569C) : const Color(0xFFE2EDFF),
      ),
    );
  }
}
