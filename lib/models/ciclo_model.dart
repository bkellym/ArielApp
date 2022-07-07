import 'package:ariel_app/models/aplicacao_model.dart';
import 'package:firebase_database/firebase_database.dart';

class CicloModel {
  late final String userUid;
  late final String uid;
  late final bool atual;
  late final String apresentacao;
  late final String dataIncio;
  late final String dosagem;
  late final String medicamento;
  late final List<AplicacaoModel> aplicacoes = [];
  late final List<double> statusAplicacoes = [];

  CicloModel();

  CicloModel.fromSnapshot(DataSnapshot snapshot) {
    Map snapshotMap = Map<String, dynamic>.from(snapshot.value as Map);
    uid = snapshot.key!;

    atual = snapshotMap['atual'];
    apresentacao = snapshotMap['apresentacao'];
    dataIncio = snapshotMap['data_incio'];
    dosagem = snapshotMap['dosagem'];
    medicamento = snapshotMap['medicamento'];

    Map<String, dynamic> mapAplicacoes =
        Map<String, dynamic>.from(snapshotMap['aplicacoes'] as Map);
    List<dynamic> listAplicacoes = mapAplicacoes.values.toList();

    listAplicacoes.sort((a, b) {
      var adate = DateTime.parse(a['data']);
      var bdate = DateTime.parse(b['data']);
      return adate.compareTo(bdate);
    });

    for (var item in listAplicacoes) {
      Map<String, dynamic> modelMap = Map<String, dynamic>.from(item as Map);
      DateTime data = DateTime.parse(modelMap['data']);
      bool feito = modelMap['feito'];
      aplicacoes.add(AplicacaoModel(cicloId: uid, data: data, feito: feito));
      statusAplicacoes.add(feito ? 1 : 0);
    }
  }
}
