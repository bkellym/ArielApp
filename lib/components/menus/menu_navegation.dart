// ignore_for_file: camel_case_types, unnecessary_const, file_names
import 'package:ariel_app/components/botoes/botao_menu.dart';
import 'package:flutter/material.dart';

import 'package:ariel_app/controller/menu_controller.dart';

import '../../core/util/size_config.dart';

class MenuNavegacao extends StatefulWidget {
  final int selectedIndex;

  const MenuNavegacao(
    this.selectedIndex, {
    Key? key,
  }) : super(key: key);

  @override
  _MenuNavegacaoState createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> {
  @override
  Widget build(BuildContext context) {
    final altura = SizeConfig.of(context).dynamicScaleSize(size: 70);

    return ClipRRect(
      child: Container(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        decoration: const BoxDecoration(color: Colors.white),
        height: altura,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: altura * (widget.selectedIndex == 1 ? 1 : 0.9),
              child: BotaoMenu(
                icon: const Icon(Icons.home_outlined),
                label: "Início",
                onPressed: () {},
              ),
            ),
            Container(
              height: altura * (widget.selectedIndex == 2 ? 1 : 0.9),
              child: BotaoMenu(
                icon: const Icon(Icons.sync_outlined),
                label: "Ciclos",
                onPressed: () {},
              ),
            ),
            Container(
              height: altura * (widget.selectedIndex == 3 ? 1 : 0.9),
              child: BotaoMenu(
                icon: const Icon(Icons.bookmarks_outlined),
                label: "Exames e\nConsultas",
                onPressed: () {},
              ),
            ),
            Container(
              height: altura * (widget.selectedIndex == 4 ? 1 : 0.9),
              child: BotaoMenu(
                icon: const Icon(Icons.person),
                label: "Perfil",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
