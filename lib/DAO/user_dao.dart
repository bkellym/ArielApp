import 'package:ariel_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:ariel_app/models/user_info_model.dart';

class UserDAO {
  final user = FirebaseAuth.instance.currentUser;

  void cadastrar(UserModel model) async {
    user?.updatePhotoURL(model.foto);
    user?.updateEmail(model.email);
    user?.updateDisplayName(model.nome);
  }
}
