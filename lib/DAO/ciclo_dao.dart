import 'package:ariel_app/controller/aplicacao_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:ariel_app/models/ciclo_model.dart';

class CicloDAO {
  final user = FirebaseAuth.instance.currentUser;
  late DatabaseReference ref;

  Future<String?> cadastrar(CicloModel model) async {
    ref = FirebaseDatabase.instance.ref("ciclo_info/${user?.uid}");
    DatabaseReference listRef = ref.push();
    String? cicloId =  listRef.key;

    await listRef.set({
      "data_incio": model.dataIncio,
      "dosagem": model.dosagem,
      "medicamento": model.medicamento,
      "apresentacao": model.apresentacao,
    });

    return cicloId;
  }
}
