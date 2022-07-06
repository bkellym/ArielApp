import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModel {
  late final String uid;
  late final String nome;
  late final String email;
  late final String foto;
  late final String genero;
  late final String dtNascimento;
  late final String _historia;
  late final String _dtUltAplicacao;

  String? get historia => _historia;
  String? get dtUltAplicacao => _dtUltAplicacao;

  set historia(String? value) {
    _historia = value ?? "";
  }

  set dtUltAplicacao(String? value) {
    _dtUltAplicacao = value ?? "";
  }

  UserModel(User? user) {
    nome = user?.displayName! ?? "";
    email = user?.email! ?? "";
    foto = user?.photoURL ?? "";
  }

  UserModel.fromSnapshot(DataSnapshot snapshot) {
    Map snapshotMap = snapshot as Map;

    uid = snapshot.key!;
    genero  = snapshotMap['genero'];
    dtNascimento  = snapshotMap['dtNascimento'];
    _historia  = snapshotMap['historia'];
    _dtUltAplicacao  = snapshotMap['dtUltAplicacao'];
  }
}
