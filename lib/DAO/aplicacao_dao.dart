import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:ariel_app/models/aplicacao_model.dart';

class AplicacaoDAO {
  final user = FirebaseAuth.instance.currentUser;
  late DatabaseReference ref;

  void cadastrar(AplicacaoModel model) async {
    ref = FirebaseDatabase.instance
        .ref("ciclo_info/${user?.uid}/${model.cicloId}/aplicacoes");

    DatabaseReference listRef = ref.push();
    listRef.set({
      "data": model.data,
    });
  }
}
