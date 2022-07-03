import 'package:flutter/material.dart';

import 'package:ariel_app/DAO/ciclo_dao.dart';
import 'package:ariel_app/models/ciclo_model.dart';
import 'package:ariel_app/controller/aplicacao_controller.dart';

class CicloController {
  final AplicacaoController controller = AplicacaoController();
  CicloDAO dao = CicloDAO();

  final TextEditingController _apresentacao = TextEditingController();
  final TextEditingController _dataIncio = TextEditingController();
  final TextEditingController _dosagem = TextEditingController();
  final TextEditingController _medicamento = TextEditingController();
  final TextEditingController _numAplicacoes = TextEditingController();
  final TextEditingController _intervalo = TextEditingController();

  CicloController(){
    _dataIncio.text = DateTime.now().toString();
  }

  TextEditingController get apresentacao {
    return _apresentacao;
  }

  TextEditingController get dataIncio {
    return _dataIncio;
  }

  TextEditingController get dosagem {
    return _dosagem;
  }

  TextEditingController get medicamento {
    return _medicamento;
  }

  TextEditingController get numAplicacoes {
    return _numAplicacoes;
  }

  TextEditingController get intervalo {
    return _intervalo;
  }

  set nome(apresentacao) {
    _apresentacao.text = apresentacao;
  }

  set data(dataIncio) {
    _dataIncio.text = dataIncio;
  }

  set dosagem(dosagem) {
    _dosagem.text = dosagem;
  }

  set medicamento(medicamento) {
    _medicamento.text = medicamento;
  }

  set numAplicacoes(numAplicacoes) {
    _numAplicacoes.text = numAplicacoes;
  }

  set intervalo(intervalo) {
    _intervalo.text = intervalo;
  }

  void cadastrar()  async {
    CicloModel model = CicloModel(
        apresentacao: _apresentacao.text,
        dataIncio: _dataIncio.text,
        medicamento: _medicamento.text,
        dosagem: _dosagem.text);
    String? cicloId = await dao.cadastrar(model);

    if(cicloId != null){
      controller.cadastrar(cicloId, int.parse(numAplicacoes.text), int.parse(_intervalo.text), model);
    }
  }
}
