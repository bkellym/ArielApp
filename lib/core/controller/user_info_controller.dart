import 'dart:io';

import 'package:ariel_app/core/DAO/user_dao.dart';
import 'package:ariel_app/core/controller/aplicacao_controller.dart';
import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/shared/mensagem_erro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UserInfoController {
  final AplicacaoController controller = AplicacaoController();
  UserDAO dao = UserDAO();

  User? _user;
  File? _foto;
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _genero = TextEditingController();
  final TextEditingController _dtNascimento = TextEditingController();
  final TextEditingController _historia = TextEditingController();
  final TextEditingController _dtUltAplicacao = TextEditingController();

  UserInfoController(this._user) {
    nome = _user?.displayName! ?? "";
    email = _user?.email! ?? "";
    dtNascimento = DateTime.parse("2000-01-01").toString();
    dtUltAplicacao = DateTime.now().toString();
  }

  UserInfoController.edicao();

  File? get foto {
    return _foto;
  }

  TextEditingController get nome {
    return _nome;
  }

  TextEditingController get email {
    return _email;
  }

  TextEditingController get genero {
    return _genero;
  }

  TextEditingController get dtNascimento {
    return _dtNascimento;
  }

  TextEditingController get historia {
    return _historia;
  }

  TextEditingController get dtUltAplicacao {
    return _dtUltAplicacao;
  }

  set nome(nome) {
    _nome.text = nome;
  }

  set email(email) {
    _email.text = email;
  }

  set genero(genero) {
    _genero.text = genero;
  }

  set dtNascimento(dataNascimento) {
    dtNascimento.text = dataNascimento;
  }

  set historia(historia) {
    _historia.text = historia;
  }

  set dtUltAplicacao(dtUltAplicacao) {
    _dtUltAplicacao.text = dtUltAplicacao;
  }

  set foto(foto) {
    _foto = foto;
  }

  Future<UserModel?> buscar() {
    Future<UserModel?> model = dao.buscar(_user);
    return model;
  }

  void cadastrar(String? fotoString) async {
    UserModel model = UserModel(_user);

    model.historia = _historia.text;
    model.genero = _genero.text;
    model.dtNascimento = _dtNascimento.text;
    model.dtUltAplicacao = _dtUltAplicacao.text;

    dao.cadastrar(model, _user);
  }

  Future<String?> _uploadFile() async {
    if (foto == null) return null;
    final fileName = basename(foto!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(foto!);
      return await ref.getDownloadURL();
    } catch (e) {
      MensagemErro(mensagem: 'Não foi possível carregar a imagem');
    }
  }
}
