import 'package:ariel_app/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserDAO {
  late DatabaseReference ref;

  Future<UserModel?> buscar(User? user) async {
    UserModel? model = UserModel(user);
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref("user_info/${user?.uid}");
    DatabaseEvent event = await userRef.once();

    final data = event.snapshot.value as Map;
    model.uid = event.snapshot.key!;
    model.genero = data['genero'];
    model.dtNascimento = data['data_de_nascimento'];
    model.historia = data['historia'];
    model.dtUltAplicacao = data['ultima_aplicacao'];

    return model;
  }

  void cadastrar(UserModel model, User? user) async {
    user?.updatePhotoURL(model.foto);
    user?.updateEmail(model.email);
    user?.updateDisplayName(model.nome);

    ref = FirebaseDatabase.instance.ref("user_info/${user?.uid}");

    await ref.set({
      "genero": model.genero,
      "data_de_nascimento": model.dtNascimento,
      "historia": model.historia ?? "",
      "ultima_aplicacao": model.dtUltAplicacao ?? "",
    });
  }
}
