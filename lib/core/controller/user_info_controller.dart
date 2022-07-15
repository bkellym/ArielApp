import 'dart:io';

import 'package:ariel_app/core/DAO/user_dao.dart';
import 'package:ariel_app/core/controller/aplicacao_controller.dart';
import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/shared/mensagem_erro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class UserInfoController {
  final AplicacaoController controller = AplicacaoController();
  UserDAO dao = UserDAO();

  final Map<String, String> generos = {
    'M': 'Masculino',
    'F': 'Feminino',
    'N': 'Não-Binário'
  };

  User? _user;
  File? _foto;
  late String uid;
  late String fotoAtual;

  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _genero = TextEditingController();
  final TextEditingController _dtNascimento = TextEditingController();
  final TextEditingController _historia = TextEditingController();
  final TextEditingController _senhaAtual = TextEditingController();
  final TextEditingController _senhaNova = TextEditingController();

  final TextEditingController _dtUltAplicacao = TextEditingController();

  UserInfoController(this._user) {
    nome = _user?.displayName! ?? "";
    email = _user?.email! ?? "";
    genero = generos["M"];
  }

  UserInfoController.edicao(UserModel model) {
    nome = model.nome;
    email = model.email;
    genero = generos[model.genero];
    dtNascimento = model.dtNascimento;
    historia = model.historia;
  }

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

  TextEditingController get senhaAtual {
    return _senhaAtual;
  }

  TextEditingController get senhaNova {
    return _senhaNova;
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

  set senhaAtual(senhaAtual) {
    _senhaAtual.text = senhaAtual;
  }

  set senhaNova(senhaNova) {
    _senhaNova.text = senhaNova;
  }

  Future<UserModel?> buscar() {
    Future<UserModel?> model = dao.buscar(_user);
    return model;
  }

  void alterar() async {
    String? fotoString = await _uploadFile();

    UserModel model = UserModel.edicao(
      uid: uid,
      nome: _nome.text,
      email: _email.text,
      foto: fotoString ?? fotoAtual,
      genero: mapGenero(_genero.text),
      dtNascimento: _dtNascimento.text,
    );
    model.historia = _historia.text;

    dao.alterar(model);
  }

  String mapGenero(String valor) {
    String chave = "M";
    generos.forEach((key, value) {
      if (valor == value) {
        chave = key;
      }
    });

    return chave;
  }

  void cadastrar() async {
    String? fotoString = await _uploadFile();

    UserModel model = UserModel(_user);

    model.foto = fotoString!;
    model.historia = _historia.text;
    model.genero = mapGenero(_genero.text);
    model.dtNascimento = _dtNascimento.text;

    dao.cadastrar(model, _user);
  }

  Future<String?> _uploadFile() async {
    if (foto == null) return null;
    final destination = 'files/$uid ?? ${_user?.uid}';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(foto!);
      return await ref.getDownloadURL();
    } catch (e) {
      MensagemErro(mensagem: 'Não foi possível carregar a imagem');
    }

    return null;
  }
}
