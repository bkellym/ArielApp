// ignore_for_file: camel_case_types, unnecessary_const, file_names
import 'package:ariel_app/core/shared/botoes/botao_menu.dart';
import 'package:ariel_app/core/models/botaoMenuModel.dart';
import 'package:flutter/material.dart';

import 'package:ariel_app/core/util/size_config.dart';

class MenuNavegacao extends StatefulWidget {
  final int selectedIndex;
  final Function onPressed;
  final List<BotaoMenuModel> itensMenu;

  const MenuNavegacao(
    this.selectedIndex, {
    Key? key,
    required this.onPressed,
    required this.itensMenu,
  }) : super(key: key);

  @override
  _MenuNavegacaoState createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> {
  @override
  Widget build(BuildContext context) {
    final altura = SizeConfig.of(context).dynamicScaleSize(size: 70);

    List<Widget> itensLista = widget.itensMenu
        .map(
          (item) => BotaoMenu(
            selected: widget.selectedIndex == item.index,
            model: item,
            onPressed: (index) {
              widget.onPressed(index);
            },
          ),
        )
        .toList();

    return Container(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.16),
            spreadRadius: 0,
            blurRadius: 9,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      height: altura,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: itensLista,
      ),
    );
  }
}
