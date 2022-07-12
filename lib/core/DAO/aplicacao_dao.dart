import 'package:ariel_app/core/models/aplicacao_model.dart';
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

  String? getNewUid(String userUid, String cicloUid) {
    ref = FirebaseDatabase.instance
        .ref("ciclo_info/$userUid/$cicloUid/aplicacoes");

    return ref.push().key;
  }

  void alterar(AplicacaoModel model, String userUid) {
    ref = FirebaseDatabase.instance
        .ref("ciclo_info/$userUid/${model.cicloId}/aplicacoes/${model.uid}");

    ref.update({
      "data": DateFormat("y-MM-dd", "pt_BR").format(model.data),
      "feito": model.feito,
    });
  }

  void deletar(AplicacaoModel model, String userUid) {
    ref = FirebaseDatabase.instance
        .ref("ciclo_info/$userUid/${model.cicloId}/aplicacoes/${model.uid}");

    ref.remove();
  }

  void registrarAplicacao(AplicacaoModel model, String userUid) {
    ref = FirebaseDatabase.instance
        .ref("ciclo_info/$userUid/${model.cicloId}/aplicacoes/${model.uid}");

    ref.update({
      "data": DateFormat("y-MM-dd", "pt_BR").format(model.data),
      "data_feito": DateFormat("y-MM-dd", "pt_BR").format(model.dataFeito),
      "feito": model.feito,
    });
  }
}
