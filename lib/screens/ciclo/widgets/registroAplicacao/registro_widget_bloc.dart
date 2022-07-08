import 'package:ariel_app/controller/aplicacao_controller.dart';
import 'package:ariel_app/controller/aplicacao_controller.dart';
import 'package:ariel_app/controller/ciclo_controller.dart';
import 'package:ariel_app/models/aplicacao_model.dart';
import 'package:ariel_app/models/ciclo_model.dart';
import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/status/atrasado.dart';
import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/status/completo.dart';
import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/status/hoje.dart';
import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/status/proximo.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistroAplicacaoBloc extends BlocBase {
  CicloController controller = CicloController();

  registrar(CicloModel cicloModel){
    controller.registraAplicacao(cicloModel);
  }

}
