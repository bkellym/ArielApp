import 'package:firebase_database/firebase_database.dart';

class ExameModel {
  late String userUid;
  late String? uid;
  late DateTime dataHora;
  late String tipo;
  late String local;
  late String detalhes;

  ExameModel();

  ExameModel.fromSnapshot(DataSnapshot snapshot) {
    try {
      Map snapshotMap = Map<String, dynamic>.from(snapshot.value as Map);
      uid = snapshot.key!;
      dataHora = DateTime.parse(snapshotMap['data_hora']);
      tipo = snapshotMap['tipo'];
      local = snapshotMap['local'];
      detalhes = snapshotMap['detalhes'];
    } catch (e) {
      print(e.toString());
    }
  }
}
