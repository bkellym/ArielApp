import 'package:firebase_database/firebase_database.dart';

class AplicacaoModel {
  late String? uid;
  late String cicloId;
  late DateTime data;
  late DateTime dataFeito;
  late bool feito;

  AplicacaoModel({
    required this.cicloId,
    required this.data,
    this.feito = false,
  });

  AplicacaoModel.fromSnapshot(DataSnapshot snapshot) {
    Map snapshotMap = Map<String, dynamic>.from(snapshot.value as Map);
    uid = snapshot.key!;
    data = DateTime.parse(snapshotMap['data']);
    feito = snapshotMap.containsKey('feito') ? snapshotMap['feito'] : false;
  }
}
