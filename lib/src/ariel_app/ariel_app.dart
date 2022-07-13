import 'package:ariel_app/core/models/botaoMenuModel.dart';
import 'package:ariel_app/core/shared/menus/menu_navegation.dart';
import 'package:ariel_app/src/ariel_app/ariel_bloc.dart';
import 'package:flutter/material.dart';

class ArielApp extends StatefulWidget {
  final int? tela;
  const ArielApp({Key? key, this.tela}) : super(key: key);

  @override
  State<ArielApp> createState() => _ArielAppState();
}

class _ArielAppState extends State<ArielApp> {
  final ArielBloc _bloc = ArielBloc();
  var buscarUsuario;

  @override
  void initState() {
    buscarUsuario = _bloc.buscarDadosUsuario(widget.tela);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _bloc.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buscarUsuario,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: _bloc.widgetOptions.elementAt(_bloc.selectedIndex),
              bottomNavigationBar: MenuNavegacao(
                _bloc.selectedIndex,
                onPressed: _onItemTapped,
                itensMenu: [
                  BotaoMenuModel(0,
                      icon: Icons.home_outlined, titulo: "Início"),
                  BotaoMenuModel(1,
                      icon: Icons.sync_outlined, titulo: "Ciclos"),
                  BotaoMenuModel(2,
                      icon: Icons.bookmarks_outlined,
                      titulo: "Exames e\nConsultas"),
                  BotaoMenuModel(3, icon: Icons.person, titulo: "Perfil"),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
