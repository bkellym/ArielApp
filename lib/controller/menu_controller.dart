import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

import 'package:ariel_app/models/button_menu.dart';

class NavigationController {
  List<NavigationButton> itens = [
    NavigationButton(
      const Icon(Icons.home),
      "Inicio",
    ),
    NavigationButton(
      const Icon(Icons.calendar_today),
      "Calendario",
    ),
    NavigationButton(
      const Icon(Icons.perm_identity),
      "Perfil",
    )
  ];

  Widget buildItem(NavigationButton item, bool isSelected) {
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
                  ? ArielColors.buttonSelected
                  : ArielColors.buttonUnselected,
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
                    : const Color(0xFFA0A3B1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
