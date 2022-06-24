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
    return ClipRRect(
      child: Container(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        decoration: const BoxDecoration(color: Colors.white),
        height: SizeConfig.of(context).dynamicScaleSize(size: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child:
            BotaoMenu(
              icon: const Icon(Icons.home_outlined),
              label: "Início",
              disabled: widget.selectedIndex != 1,
              onPressed: () {},
            ),),
            BotaoMenu(
              icon: const Icon(Icons.sync_outlined),
              label: "Ciclos",
              disabled: widget.selectedIndex != 2,
              onPressed: () {},
            ),
            BotaoMenu(
              icon: const Icon(Icons.bookmarks_outlined),
              label: "Exames e\nConsultas",
              disabled: widget.selectedIndex != 3,
              onPressed: () {},
            ),
            BotaoMenu(
              icon: const Icon(Icons.person),
              label: "Perfil",
              disabled: widget.selectedIndex != 4,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
