import 'package:ariel_app/models/aplicacao_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class AplicacaoDAO {
  final user = FirebaseAuth.instance.currentUser;
  late DatabaseReference ref;

  Future<dynamic> buscar(String? cicloUid) async {
    String? uid = user?.uid;
    if (uid == null || cicloUid == null) return null;

    DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child("ciclo_info")
        .child(uid)
        .child(cicloUid)
        .child("aplicacoes");
    DatabaseEvent event = await ref.once();
    return event.snapshot;
  }

  void cadastrar(AplicacaoModel model) async {
    ref = FirebaseDatabase.instance
        .ref("ciclo_info/${user?.uid}/${model.cicloId}/aplicacoes");

    DatabaseReference listRef = ref.push();
    listRef.set({
      "data": DateFormat("y-MM-dd", "pt_BR").format(model.data),
      "feito": model.feito,
    });
  }
}
