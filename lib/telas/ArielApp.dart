// ignore_for_file: camel_case_types, unnecessary_const, file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'TelaInicial.dart';

/// This is the stateful widget that the main application instantiates.
class ArielApp extends StatefulWidget {
  const ArielApp({Key? key}) : super(key: key);

  @override
  State<ArielApp> createState() => _ArielAppState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ArielAppState extends State<ArielApp> {
  int _telaSelecionada = 0;

  final List<Widget> _telas = <Widget>[
    const TelaInicial(),
    const Text(
      'Index 1: Calendario',
    ),
    /*const Text(
      'Index 2: Artigos',
    ),*/
    const Text(
      'Index 3: Perfil',
    ),
  ];

  void _selecionaTela(int index) {
    setState(() {
      _telaSelecionada = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Center(
            child: _telas.elementAt(_telaSelecionada),
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
      bottomNavigationBar: const MenuNavegacao(),
    );
  }
}

class MenuNavegacao extends StatefulWidget {
  const MenuNavegacao({Key? key}) : super(key: key);

  @override
  _MenuNavegacaoState createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> {
  int selectedIndex = 0;

  List<NavigationItem> itens = [
    NavigationItem(const Icon(Icons.home), "Inicio"),
    NavigationItem(const Icon(Icons.calendar_today), "Calendario"),
    NavigationItem(const Icon(Icons.perm_identity), "Perfil")
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
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
              child: item.icon,
              data: IconThemeData(
                size: 28,
                color: isSelected ? Colors.white : const Color(0xFFA0A3B1),
              ),
            ),
            width: 40,
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              item.title,
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

  @override
  Widget build(BuildContext context) {
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
          children: itens.map((item) {
            var itemIndex = itens.indexOf(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = itemIndex;
                });
              },
              child: _buildItem(item, itemIndex == selectedIndex),
            );

            //return _buildItem(item, false);
          }).toList(),
        ),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final String title;

  NavigationItem(this.icon, this.title);
}
