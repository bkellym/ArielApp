import 'package:ariel_app/core/DAO/resultado_exame_dao.dart';
import 'package:ariel_app/core/models/resultado_exame_model.dart';
import 'package:flutter/material.dart';

class ResultadoExameController {
  ResultadoExameDAO dao = ResultadoExameDAO();

  ResultadoExameController() {
    _data.text = DateTime.now().toString();
  }

  final TextEditingController _nome = TextEditingController();
  final TextEditingController _data = TextEditingController();
  final TextEditingController _dosagem = TextEditingController();

  TextEditingController get nome {
    return _nome;
  }

  TextEditingController get data {
    return _data;
  }

  TextEditingController get dosagem {
    return _dosagem;
  }

  set nome(nome) {
    _nome.text = nome;
  }

  set data(data) {
    _data.text = data;
  }

  set dosagem(dosagem) {
    _dosagem.text = dosagem;
  }

  void cadastrar() {
    ResultadoExameModel model =
        ResultadoExameModel(_nome.text, _data.text, _dosagem.text);
    dao.cadastrar(model);
  }
}
