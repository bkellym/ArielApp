// ignore_for_file: camel_case_types, unnecessary_const, file_names
import 'package:flutter/material.dart';

import 'package:ariel_app/controller/menu_controller.dart';

class MenuNavegacao extends StatefulWidget {
  int selectedIndex;

  MenuNavegacao({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _MenuNavegacaoState createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> {

  @override
  Widget build(BuildContext context) {
    NavigationController controller = NavigationController();

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: controller.itens.map((item) {
            var itemIndex = controller.itens.indexOf(item);
            return GestureDetector(
              onTap: () {},
              child: controller.buildItem(item, itemIndex == widget.selectedIndex),
            );
          }).toList(),
        ),
      ),
    );
  }
}
