import 'package:ariel_app/core/controller/aplicacao_controller.dart';
import 'package:ariel_app/core/controller/ciclo_controller.dart';
import 'package:ariel_app/core/controller/consulta_controller.dart';
import 'package:ariel_app/core/controller/exame_controller.dart';
import 'package:ariel_app/core/models/aplicacao_model.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/models/consulta_model.dart';
import 'package:ariel_app/core/models/exame_model.dart';
import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/src/ariel_app/inicio/widgets/user_foto.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InicioBloc extends BlocBase {
  late UserModel user;
  CicloModel? ciclo;
  ExameModel? exame;
  ConsultaModel? consulta;
  DateTime? proxAplicacao;
  DateTime? ultAplicacao;

  List<double> chartData = [];
  List<AplicacaoModel> aplicacoes = [];

  CicloController cicloController = CicloController();
  AplicacaoController aplicacaoController = AplicacaoController();
  ExameController exameController = ExameController();
  ConsultaController consultaController = ConsultaController();

  buscarDadosUsuario(UserModel user) async {
    this.user = user;
    chartData = [];
    ciclo = (await cicloController.buscarCicloAtual());

    if (ciclo != null) {
      var cicloUid = ciclo?.uid;

      if (cicloUid != null) {
        aplicacoes = (await aplicacaoController.buscar(cicloUid));
        proxAplicacao = (await aplicacaoController.buscarProx(aplicacoes));
        ultAplicacao = (await aplicacaoController.buscarUlt(aplicacoes));
      }
    }

    exame = await exameController.buscarProxima(user.uid);
    consulta = await consultaController.buscarProxima(user.uid);

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

  String getUltAplic() {
    return DateFormat("dd/MM/y", "pt_BR").format(ultAplicacao!);
  }
}
