import 'dart:io';
import 'package:ariel_app/components/mensagem_erro.dart';
import 'package:ariel_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:ariel_app/DAO/user_dao.dart';
import 'package:ariel_app/controller/aplicacao_controller.dart';

class UserInfoController {
  final AplicacaoController controller = AplicacaoController();
  UserDAO dao = UserDAO();

  File? foto;
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _genero = TextEditingController();
  final TextEditingController _dtNascimento = TextEditingController();
  final TextEditingController _historia = TextEditingController();
  final TextEditingController _dtUltAplicacao = TextEditingController();

  UserInfoController(User? user) {
    nome = user?.displayName! ?? "";
    email = user?.email! ?? "";
    dtNascimento = DateTime.parse("2000-01-01").toString();
    dtUltAplicacao = DateTime.now().toString();
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

  void cadastrar() async {
    String? fotoString = await _uploadFile();
    UserModel model = UserModel(
      nome: nome.text,
      email: email.text,
      foto: fotoString ?? "",
      genero: genero.text,
      dtNascimento: dtNascimento.text,
      historia: historia.text,
      dtUltAplicacao: dtUltAplicacao.text,
    );

    dao.cadastrar(model);
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

