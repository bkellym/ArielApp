import 'package:ariel_app/screens/exames_consultas/widgets/detalhes_consultas/detalhe_consulta_widgets.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class DetalheConsultaBloc extends BlocBase {
  List<Widget> listWidgets = [
    const Detalhe(),
    CadastrarOuEditar(),
  ];
}
