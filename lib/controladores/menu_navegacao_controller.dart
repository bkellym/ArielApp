import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ariel_app/models/item_navegacao.dart';

import 'package:ariel_app/telas/TelaInicial.dart';
import 'package:ariel_app/telas/Calendario.dart';
import 'package:ariel_app/telas/Perfil.dart';

class NavigationController {
  List<ItemNavegacao> itens = [
    ItemNavegacao(
      const Icon(Icons.home),
      "Inicio",
      const TelaInicial(),
    ),
    ItemNavegacao(
      const Icon(Icons.calendar_today),
      "Calendario",
      const Calendario(),
    ),
    ItemNavegacao(
      const Icon(Icons.perm_identity),
      "Perfil",
      const Perfil(),
    )
  ];

  Widget buildItem(ItemNavegacao item, bool isSelected) {
    return Container(
      width: 96,
      height: double.maxFinite,
      padding: const EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 270),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF3A89E9)
                  : const Color(0x003A89E9),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: IconTheme(
              child: item.icone,
              data: IconThemeData(
                size: 28,
                color: isSelected ? Colors.white : const Color(0xFFA0A3B1),
              ),
            ),
            width: 35,
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              item.titulo,
              style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? const Color(0xFF3A89E9)
                      : const Color(0xFFA0A3B1)),
            ),
          ),
        ],
      ),
    );
  }
}
