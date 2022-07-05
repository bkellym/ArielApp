import 'package:firebase_database/firebase_database.dart';

class CicloModel {
  late final String uid;
  late final bool atual;
  late final String apresentacao;
  late final String dataIncio;
  late final String dosagem;
  late final String medicamento;

  CicloModel();

  CicloModel.fromSnapshot(DataSnapshot snapshot) {
    Map snapshotMap = Map<String, dynamic>.from(snapshot.value as Map);
    uid = snapshot.key!;
    atual = snapshotMap['atual'];
    apresentacao = snapshotMap['apresentacao'];
    dataIncio = snapshotMap['data_incio'];
    dosagem = snapshotMap['dosagem'];
    medicamento = snapshotMap['medicamento'];
  }
}
