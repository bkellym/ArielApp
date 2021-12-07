// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../componentes/menu_navegacao.dart';

class TemplateApp extends StatelessWidget {
  final Widget tela;
  final int menu_index;

  const TemplateApp({Key? key, required this.tela, this.menu_index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Center(
            child: tela,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF64A9F7),
                Color(0xFFC6E1FF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      extendBody: true,
      bottomNavigationBar: MenuNavegacao(
        selectedIndex: menu_index,
      ),
    );
  }
}
