import 'package:ariel_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserDAO {
  final user = FirebaseAuth.instance.currentUser;
  late DatabaseReference ref;

  void cadastrar(UserModel model) async {
    await  user?.updatePhotoURL(model.foto);
    await  user?.updateEmail(model.email);
    await  user?.updateDisplayName(model.nome);

    ref = FirebaseDatabase.instance.ref("user_info/${user?.uid}");
    
    await ref.set({
      "genero": model.genero,
      "data_de_nascimento": model.dtNascimento,
      "historia": model.historia,
      "ultima_aplicacao": model.dtUltAplicacao,
    });
  }
}
