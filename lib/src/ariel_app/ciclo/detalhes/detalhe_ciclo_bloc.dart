import 'package:ariel_app/core/models/aplicacao_model.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class DetalheCicloBloc extends BlocBase {
  DateTime? getProxAplicacao(CicloModel ciclo) {
    List<AplicacaoModel> filtrado =
        ciclo.aplicacoes.where((element) => element.feito == false).toList();

    if (filtrado.isEmpty) return null;

    return filtrado.first.data;
  }

  DateTime? getUltAplicacao(CicloModel ciclo) {
    List<AplicacaoModel> filtrado =
        ciclo.aplicacoes.where((element) => element.feito == true).toList();

    if (filtrado.isEmpty) return null;

    return filtrado.last.data;
  }

  String getFaseAplicacao(CicloModel ciclo) {
    int jaAplicado =
        ciclo.statusAplicacoes.where((element) => element == 1).length;
    return "$jaAplicadoª aplicação";
  }
}
