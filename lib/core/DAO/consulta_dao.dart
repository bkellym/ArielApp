import 'package:ariel_app/core/models/consulta_model.dart';
import 'package:firebase_database/firebase_database.dart';

class ConsultaDAO {
  Future<dynamic> buscarTodos(String userUid) async {
    Query ref = FirebaseDatabase.instance
        .ref()
        .child("consultas")
        .child(userUid)
        .orderByChild("data_hora");
    DatabaseEvent event = await ref.once();
    return event.snapshot;
  }

  Future<String?> cadastrar(ConsultaModel model) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("consultas/${model.userUid}");
    DatabaseReference listRef = ref.push();
    String? exameUid = listRef.key;

    await listRef.set({
      "data_hora": model.dataHora.toString(),
      "especialidade": model.especialidade,
      "medico": model.medico,
      "endereco": model.endereco,
      "detalhes": model.detalhes,
    });

    return exameUid;
  }

  void alterar(ConsultaModel model) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("consultas/${model.userUid}/${model.uid}");

    await ref.update({
      "data_hora": model.dataHora.toString(),
      "especialidade": model.especialidade,
      "medico": model.medico,
      "endereco": model.endereco,
      "detalhes": model.detalhes,
    });
  }
}
