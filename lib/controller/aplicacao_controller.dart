import 'package:ariel_app/DAO/aplicacao_dao.dart';
import 'package:ariel_app/models/aplicacao_model.dart';
import 'package:ariel_app/models/ciclo_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class AplicacaoController {
  AplicacaoDAO dao = AplicacaoDAO();

  Future<List<double>> buscarStatusAplicacoes(cicloUid) async{
    List<double> lista = [];
    await buscar(cicloUid).then((value) {
      for (AplicacaoModel val in value) {
        lista.add((val.feito ? 1 : 0));
      }
    });
    return lista;
  }

  Future<DateTime> buscarProx(List<AplicacaoModel> listAplicacoes) async {
    List<AplicacaoModel> filtrado = listAplicacoes.where((element) => element.feito == false).toList();
    filtrado.sort((a,b) {
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

    for(DataSnapshot aplic in aplicacoes){
      AplicacaoModel model = AplicacaoModel.fromSnapshot(aplic);
        model.cicloId = cicloUid;
        // model.data = DateTime.parse(model.stringData);
        listAplicacoes.add(model);
    }

    return listAplicacoes;
  }

  cadastrar(
      String cicloId, int numAplicacoes, int intervalo, CicloModel ciclo) {
    DateTime data = DateTime.parse(ciclo.dataIncio);
    for (int i = 0; i < numAplicacoes; i++) {
      String dataString = DateFormat("dd/MM/y", "pt_BR").format(data);
      AplicacaoModel model = AplicacaoModel(cicloId: cicloId, data: data);
      dao.cadastrar(model);
      data = data.add(Duration(days: intervalo));
    }
  }
}
