import 'package:ariel_app/core/models/exame_model.dart';
import 'package:firebase_database/firebase_database.dart';

class ExameDAO {
  Future<dynamic> buscarTodos(String userUid) async {
    Query ref = FirebaseDatabase.instance
        .ref()
        .child("exames")
        .child(userUid)
        .orderByChild("data_hora");
    DatabaseEvent event = await ref.once();
    return event.snapshot;
  }

  Future<String?> cadastrar(ExameModel model) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("exames/${model.userUid}");
    DatabaseReference listRef = ref.push();
    String? exameUid = listRef.key;

    await listRef.set({
      "data_hora": model.dataHora.toString(),
      "tipo": model.tipo,
      "local": model.local,
      "detalhes": model.detalhes,
    });

    return exameUid;
  }

  void alterar(ExameModel model) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("exames/${model.userUid}/${model.uid}");

    await ref.update({
      "data_hora": model.dataHora.toString(),
      "tipo": model.tipo,
      "local": model.local,
      "detalhes": model.detalhes,
    });
  }
}
