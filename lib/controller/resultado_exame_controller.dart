import 'package:ariel_app/DAO/resultado_exame_dao.dart';
import 'package:flutter/material.dart';
import 'package:ariel_app/models/resultado_exame_model.dart';

class ResultadoExameController {
  ResultadoExameDAO dao = ResultadoExameDAO();

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

  set data(nome) {
    _data.text = nome;
  }

  set dosagem(nome) {
    _dosagem.text = nome;
  }

  void salvar() {
    ResultadoExameModel model =
        ResultadoExameModel(_nome.text, _data.text, _dosagem.text);
    dao.salvar(model);
  }
}
