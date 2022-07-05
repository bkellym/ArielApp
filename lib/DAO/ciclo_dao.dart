import 'package:ariel_app/controller/aplicacao_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:ariel_app/models/ciclo_model.dart';

class CicloDAO {
  final user = FirebaseAuth.instance.currentUser;
  late DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<dynamic> buscar() async {
    String? uid = user?.uid;
    if (uid == null) return null;

    DatabaseReference ciclosRef = ref.child("ciclo_info").child(uid);
    DatabaseEvent event = await ciclosRef.once();
    return event.snapshot;
  }

  Future<String?> cadastrar(CicloModel model) async {
    ref = FirebaseDatabase.instance.ref("ciclo_info/${user?.uid}");
    DatabaseReference listRef = ref.push();
    String? cicloId = listRef.key;

    await listRef.set({
      "atual": true,
      "data_incio": model.dataIncio,
      "dosagem": model.dosagem,
      "medicamento": model.medicamento,
      "apresentacao": model.apresentacao,
    });

    return cicloId;
  }
}