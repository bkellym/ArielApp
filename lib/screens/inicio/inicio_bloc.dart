import 'package:ariel_app/controller/aplicacao_controller.dart';
import 'package:ariel_app/controller/ciclo_controller.dart';
import 'package:ariel_app/models/aplicacao_model.dart';
import 'package:ariel_app/models/ciclo_model.dart';
import 'package:ariel_app/models/user_model.dart';
import 'package:ariel_app/screens/inicio/widgets/user_foto.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InicioBloc extends BlocBase {
  late UserModel user;
  CicloModel? ciclo;
  DateTime? proxAplicacao;

  List<double> chartData = [];
  List<AplicacaoModel> aplicacoes = [];

  CicloController cicloController = CicloController();
  AplicacaoController aplicacaoController = AplicacaoController();

  buscarDadosUsuario(UserModel user) async {
    this.user = user;
    chartData = [];
    ciclo = (await cicloController.buscarCicloAtual());
    var cicloUid = ciclo?.uid;

    if (cicloUid != null) {
      aplicacoes = (await aplicacaoController.buscar(cicloUid));
      proxAplicacao = (await aplicacaoController.buscarProx(aplicacoes));
    }
    return chartData;
  }

  Widget getFotoUsuario() => UserFoto(
        foto: user.foto,
        inicialNome: user.nome.substring(0, 1),
      );

  List<double> getCharData() {
    chartData = [];
    for (AplicacaoModel val in aplicacoes) {
      chartData.add((val.feito ? 1 : 0));
    }
    return chartData;
  }

  String getFaseCiclo() {
    String completos =
        chartData.where((element) => element == 1).length.toString();
    return "$completosª aplicação de ${chartData.length.toString()}";
  }

  String getProxAplic() {
    return DateFormat("dd/MM/y", "pt_BR").format(proxAplicacao!);
  }
}
