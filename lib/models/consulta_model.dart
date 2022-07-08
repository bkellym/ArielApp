import 'package:firebase_database/firebase_database.dart';

class ConsultaModel {
  late String userUid;
  late String? uid;
  late DateTime dataHora;
  late String especialidade;
  late String medico;
  late String endereco;
  late String detalhes;

  ConsultaModel();

  ConsultaModel.fromSnapshot(DataSnapshot snapshot) {
    try {
      Map snapshotMap = Map<String, dynamic>.from(snapshot.value as Map);
      uid = snapshot.key!;
      dataHora = DateTime.parse(snapshotMap['data_hora']);
      especialidade = snapshotMap['especialidade'];
      medico = snapshotMap['medico'];
      endereco = snapshotMap['endereco'];
      detalhes = snapshotMap['detalhes'];
    }
    catch (e){
      print(e.toString());
    }
  }
}
