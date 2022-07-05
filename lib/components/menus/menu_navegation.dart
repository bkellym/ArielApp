// ignore_for_file: camel_case_types, unnecessary_const, file_names
import 'package:ariel_app/components/botoes/botao_menu.dart';
import 'package:flutter/material.dart';

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
              child: BotaoMenu(
                selected: widget.selectedIndex == 1,
                icon: const Icon(Icons.home_outlined),
                label: "Início",
                onPressed: () {},
              ),
            ),
            Container(
              child: BotaoMenu(
                selected: widget.selectedIndex == 2,
                icon: const Icon(Icons.sync_outlined),
                label: "Ciclos",
                onPressed: () {},
              ),
            ),
            Container(
              child: BotaoMenu(
                selected: widget.selectedIndex == 3,
                icon: const Icon(Icons.bookmarks_outlined),
                label: "Exames e\nConsultas",
                onPressed: () {},
              ),
            ),
            Container(
              child: BotaoMenu(
                selected: widget.selectedIndex == 4,
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
