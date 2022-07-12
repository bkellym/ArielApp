import 'package:ariel_app/core/controller/ciclo_controller.dart';
import 'package:ariel_app/core/models/aplicacao_model.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class CadastroEdicaobloc extends BlocBase {
  late final String userUid;
  late final String? cicloUid;
  final controller = CicloController();

  init(String userUid, String? cicloUid, CicloModel? ciclo) async {
    this.userUid = userUid;
    this.cicloUid = cicloUid;

    if (ciclo != null) {
      controller.medicamento = ciclo.medicamento;
      controller.data = ciclo.dataIncio;
      controller.dosagem = ciclo.dosagem;
      controller.apresentacao = ciclo.apresentacao;
      controller.intervalo = ciclo.aplicacoes[1].data
          .difference(ciclo.aplicacoes[0].data)
          .inDays
          .toString();
      controller.numAplicacoes = ciclo.aplicacoes.length.toString();
      controller.dataUltAplicacao = getUltimaAplicacao(ciclo);
    }
  }

  getUltimaAplicacao(CicloModel cicloModel) {
    List<AplicacaoModel> filtrado = cicloModel.aplicacoes
        .where((element) => element.feito == true)
        .toList();

    return filtrado.last.data.toString();
  }

  cadastrarEditar(CicloModel? model) {
    if (model != null) {
      controller.alterar(model);
    } else {
      controller.cadastrar();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
