import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:ariel_app/screens/exames_consultas//widgets/detalhe_exame/detalhe_exame_widgets.dart';

class DetalheExameBloc extends BlocBase {
  List<Widget> listWidgets = [
    const Detalhe(),
    CadastrarOuEditar(),
    InserirResultados(),
  ];
}
