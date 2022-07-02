import 'package:ariel_app/models/aplicacao_model.dart';
import 'package:intl/intl.dart';
import 'package:ariel_app/DAO/aplicacao_dao.dart';
import 'package:ariel_app/models/ciclo_model.dart';

class AplicacaoController {
  AplicacaoDAO dao = AplicacaoDAO();

  cadastrar(String cicloId, int numAplicacoes, int intervalo, CicloModel ciclo){
    DateTime inicio = DateTime.parse(ciclo.dataIncio);
    for(int i = 0; i < numAplicacoes; i++){
      String dataString = DateFormat("dd/MM/y", "pt_BR").format(inicio);
      AplicacaoModel model = AplicacaoModel(cicloId: cicloId, data: dataString);
      dao.cadastrar(model);
      inicio = inicio.add(Duration(days: intervalo));
    }
  }
}
