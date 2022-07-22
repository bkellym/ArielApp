import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModel {
  late final String uid;
  late final String nome;
  late final String email;
  String? foto;
  late final String genero;
  late final String dtNascimento;
  late final String _historia;

  String? get historia => _historia;

  set historia(String? value) {
    _historia = value ?? "";
  }

  UserModel(User? user) {
    nome = user?.displayName! ?? "";
    email = user?.email! ?? "";
    foto = user?.photoURL ?? "";
  }

  UserModel.edicao({
    required this.uid,
    required this.nome,
    required this.email,
    required this.foto,
    required this.genero,
    required this.dtNascimento,
  });

  UserModel.fromSnapshot(DataSnapshot snapshot) {
    Map snapshotMap = snapshot as Map;

    uid = snapshot.key!;
    genero = snapshotMap['genero'];
    dtNascimento = snapshotMap['dtNascimento'];
    _historia = snapshotMap['historia'];
  }
}
