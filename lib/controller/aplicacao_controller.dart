import 'package:ariel_app/DAO/aplicacao_dao.dart';
import 'package:ariel_app/models/aplicacao_model.dart';
import 'package:ariel_app/models/ciclo_model.dart';
import 'package:firebase_database/firebase_database.dart';

class AplicacaoController {
  AplicacaoDAO dao = AplicacaoDAO();

  void registrar(AplicacaoModel aplicacaoModel, userUid) {
    aplicacaoModel.feito = true;
    dao.registrarAplicacao(aplicacaoModel, userUid);
  }

  Future<List<double>> buscarStatusAplicacoes(cicloUid) async {
    List<double> lista = [];
    await buscar(cicloUid).then((value) {
      for (AplicacaoModel val in value) {
        lista.add((val.feito ? 1 : 0));
      }
    });
    return lista;
  }

  Future<DateTime> buscarProx(List<AplicacaoModel> listAplicacoes) async {
    List<AplicacaoModel> filtrado =
        listAplicacoes.where((element) => element.feito == false).toList();
    filtrado.sort((a, b) {
      var adate = a.data; //before -> var adate = a.expiry;
      var bdate = b.data; //var bdate = b.expiry;
      return adate.compareTo(bdate);
    });

    DateTime prox = filtrado.first.data;
    return prox;
  }

  Future<List<AplicacaoModel>> buscar(String cicloUid) async {
    List<AplicacaoModel> listAplicacoes = [];
    DataSnapshot snapshot = await dao.buscar(cicloUid);
    Iterable<DataSnapshot> aplicacoes = snapshot.children;

    for (DataSnapshot aplic in aplicacoes) {
      AplicacaoModel model = AplicacaoModel.fromSnapshot(aplic);
      model.cicloId = cicloUid;
      // model.data = DateTime.parse(model.stringData);
      listAplicacoes.add(model);
    }

    return listAplicacoes;
  }

  void cadastrar(String cicloId, int numAplicacoes, int intervalo,
      CicloModel ciclo, DateTime? dtUltimaAplicacao) {
    DateTime data = DateTime.parse(ciclo.dataIncio);
    for (int i = 0; i < numAplicacoes; i++) {
      AplicacaoModel model = AplicacaoModel(cicloId: cicloId, data: data);

      if (dtUltimaAplicacao != null) {
        model.feito = model.data.compareTo(dtUltimaAplicacao) <= 0;
      }

      dao.cadastrar(model);
      data = data.add(Duration(days: intervalo));
    }
  }

  void alterarAplicacoesCiclo(CicloModel ciclo, int numAplicacoes,
      int intervalo, DateTime? dtUltimaAplicacao) {
    DateTime data = DateTime.parse(ciclo.dataIncio);

    if (numAplicacoes == ciclo.aplicacoes.length) {
      for (AplicacaoModel aplicacaoModel in ciclo.aplicacoes) {
        aplicacaoModel.data = data;

        if (dtUltimaAplicacao != null) {
          aplicacaoModel.feito =
              aplicacaoModel.data.compareTo(dtUltimaAplicacao) <= 0;
        }
        dao.alterar(aplicacaoModel, ciclo.userUid);
        data = data.add(Duration(days: intervalo));
      }
    } else if (numAplicacoes > ciclo.aplicacoes.length) {
      List<AplicacaoModel?> list = ciclo.aplicacoes;
      for (int i = 0; i < numAplicacoes; i++) {
        AplicacaoModel? model;
        if (i < list.length) {
          model = list[i];
        } else {
          model = AplicacaoModel(cicloId: ciclo.uid, data: data);
          model.uid = dao.getNewUid(ciclo.userUid, ciclo.uid);
        }

        if (model == null) continue;

        if (dtUltimaAplicacao != null) {
          model.feito = (model.data.compareTo(dtUltimaAplicacao) <= 0);
        }

        dao.alterar(model, ciclo.userUid);
        data = data.add(Duration(days: intervalo));
      }
    } else {
      int alterado = 0;
      for (AplicacaoModel aplicacaoModel in ciclo.aplicacoes) {
        if (alterado < numAplicacoes) {
          aplicacaoModel.data = data;

          if (dtUltimaAplicacao != null) {
            aplicacaoModel.feito =
                aplicacaoModel.data.compareTo(dtUltimaAplicacao) <= 0;
          }
          dao.alterar(aplicacaoModel, ciclo.userUid);
          data = data.add(Duration(days: intervalo));
        } else {
          dao.deletar(aplicacaoModel, ciclo.userUid);
        }
        alterado++;
      }
    }
  }
}
