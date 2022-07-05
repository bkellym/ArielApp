import 'package:ariel_app/components/menus/menu_navegation.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/models/botaoMenuModel.dart';
import 'package:ariel_app/screens/ciclo/ciclo_page.dart';
import 'package:ariel_app/screens/exames_consultas/exames_consultas_page.dart';
import 'package:ariel_app/screens/inicio/inicio_page.dart';
import 'package:ariel_app/screens/perfil/perfil_page.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    InicioPage(),
    CicloPage(),
    ExamesConsultasPage(),
    PerfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: MenuNavegacao(
        _selectedIndex,
        onPressed: _onItemTapped,
        itensMenu: [
          BotaoMenuModel(0, icon: Icons.home_outlined, titulo: "Início"),
          BotaoMenuModel(1, icon: Icons.sync_outlined, titulo: "Ciclos"),
          BotaoMenuModel(2, icon: Icons.bookmarks_outlined, titulo: "Exames e\nConsultas"),
          BotaoMenuModel(3, icon: Icons.person, titulo: "Perfil"),
        ],
      ),
    );
  }
}
