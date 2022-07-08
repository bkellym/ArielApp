import 'package:ariel_app/models/resultado_exame_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ResultadoExameDAO {
  final user = FirebaseAuth.instance.currentUser;
  late DatabaseReference ref;

  void cadastrar(ResultadoExameModel model) async {
    ref = FirebaseDatabase.instance.ref("resultados_exames/${user?.uid}");
    DatabaseReference listRef = ref.push();

    listRef.set({
      "nome": model.nome,
      "data": model.data,
      "dosagem": int.parse(model.dosagem),
    });
  }
}
