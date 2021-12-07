// ignore_for_file: camel_case_types, unnecessary_const, file_names
import 'package:ariel_app/controladores/menu_navegacao_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuNavegacao extends StatefulWidget {
  final int selectedIndex;

  const MenuNavegacao({Key? key, required this.selectedIndex})
      : super(key: key);

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
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return item.tela;
                  }));
                });
              },
              child:
                  controller.buildItem(item, itemIndex == widget.selectedIndex),
            );

            //return _buildItem(item, false);
          }).toList(),
        ),
      ),
    );
  }
}
