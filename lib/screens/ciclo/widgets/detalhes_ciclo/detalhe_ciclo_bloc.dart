import 'package:ariel_app/models/ciclo_model.dart';
import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/status/atrasado.dart';
import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/status/hoje.dart';
import 'package:ariel_app/screens/ciclo/widgets/detalhes_ciclo/status/proximo.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalheCicloBloc extends BlocBase {
  DateTime getProxAplicacao(CicloModel ciclo) {
    return ciclo.aplicacoes
        .where((element) => element.feito == false)
        .first
        .data;
  }

  String getFaseAplicacao(CicloModel ciclo) {
    int jaAplicado =
        ciclo.statusAplicacoes.where((element) => element == 1).length;
    return "$jaAplicadoª aplicação de ${ciclo.statusAplicacoes.length}";
  }

  Widget getStatusAplicacao(CicloModel ciclo) {
    DateTime prox = getProxAplicacao(ciclo);
    int dias = prox
        .difference(DateFormat('yyyy-MM-dd').parse(DateTime.now().toString()))
        .inDays;

    if (dias < 0) {
      return const StatusAtrasado();
    } else if (dias == 0) {
      return const StatusHoje();
    } else {
      return StatusProximo(dias: dias);
    }
  }
}
