import 'dart:io';

import 'package:ariel_app/core/controller/user_info_controller.dart';
import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/shared/mensagem_erro.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class EditarPerfilBloc extends BlocBase {
  late final UserInfoController controller;
  List<String> listaGeneros = [];
  File? foto;

  init(UserModel model) async {
    controller = UserInfoController.edicao(model);
    controller.uid = model.uid;
    controller.fotoAtual = model.foto!;
    listaGeneros.addAll(controller.generos.values.toList());
    print(listaGeneros);
    return true;
  }

  Future<String?> _uploadFile(File? foto) async {
    if (foto == null) return null;
    final fileName = basename(foto.path);
    final destination = 'files/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(foto);
      return await ref.getDownloadURL();
    } catch (e) {
      MensagemErro(mensagem: 'Não foi possível carregar a imagem');
    }
    return null;
  }
}
