import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/detalhe_ciclo_widgets.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class DetalheCicloBloc extends BlocBase {
  List<Widget> listWidgets = [
    const Detalhe(),
    CadastrarOuEditar(),
    RegistrarAplicacao(),
  ];
}
