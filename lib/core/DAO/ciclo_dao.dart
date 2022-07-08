import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CicloDAO {
  final user = FirebaseAuth.instance.currentUser;
  late DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<dynamic> buscarTodos(String userUid) async {
    Query ciclosRef =
        ref.child("ciclo_info").child(userUid).orderByChild("data");
    DatabaseEvent event = await ciclosRef.once();
    return event.snapshot;
  }

  Future<dynamic> buscarCicloAtual() async {
    String? uid = user?.uid;
    if (uid == null) return null;

    Query ciclosRef = ref
        .child("ciclo_info")
        .child(uid)
        .orderByChild("atual")
        .equalTo(true)
        .limitToFirst(1);
    DatabaseEvent event = await ciclosRef.ref.once();
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

  void alterar(CicloModel model) async {
    ref = FirebaseDatabase.instance
        .ref("ciclo_info/${model.userUid}/${model.uid}");

    await ref.update({
      "atual": model.atual,
      "data_incio": model.dataIncio,
      "dosagem": model.dosagem,
      "medicamento": model.medicamento,
      "apresentacao": model.apresentacao,
    });
  }
}
