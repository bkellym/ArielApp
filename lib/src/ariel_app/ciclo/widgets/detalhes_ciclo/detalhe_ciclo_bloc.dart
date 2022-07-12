import 'package:ariel_app/core/models/aplicacao_model.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/detalhes_ciclo/status/atrasado.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/detalhes_ciclo/status/completo.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/detalhes_ciclo/status/hoje.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/detalhes_ciclo/status/proximo.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalheCicloBloc extends BlocBase {
  DateTime? getProxAplicacao(CicloModel ciclo) {
    List<AplicacaoModel> filtrado =
        ciclo.aplicacoes.where((element) => element.feito == false).toList();

    if (filtrado.isEmpty) return null;

    return filtrado.first.data;
  }

  String getFaseAplicacao(CicloModel ciclo) {
    int jaAplicado =
        ciclo.statusAplicacoes.where((element) => element == 1).length;
    return "$jaAplicadoª aplicação de ${ciclo.statusAplicacoes.length}";
  }

  Widget getStatusAplicacao(CicloModel ciclo) {
    DateTime? prox = getProxAplicacao(ciclo);

    if (prox == null) return const StatusCompleto();

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
