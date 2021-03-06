import 'package:ariel_app/core/DAO/ciclo_dao.dart';
import 'package:ariel_app/core/controller/aplicacao_controller.dart';
import 'package:ariel_app/core/models/aplicacao_model.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CicloController {
  final AplicacaoController controller = AplicacaoController();
  AplicacaoController aplicacoesController = AplicacaoController();
  CicloDAO dao = CicloDAO();

  final TextEditingController _apresentacao = TextEditingController();
  final TextEditingController _dataIncio = TextEditingController();
  final TextEditingController _dataUltAplicacao = TextEditingController();
  final TextEditingController _dosagem = TextEditingController();
  final TextEditingController _medicamento = TextEditingController();
  final TextEditingController _numAplicacoes = TextEditingController();
  final TextEditingController _intervalo = TextEditingController();
  final TextEditingController _dataAplicacao = TextEditingController();

  dispose() {
    _apresentacao.dispose();
    _dataIncio.dispose();
    _dosagem.dispose();
    _medicamento.dispose();
    _numAplicacoes.dispose();
    _intervalo.dispose();
    _dataAplicacao.dispose();
  }

  TextEditingController get apresentacao {
    return _apresentacao;
  }

  TextEditingController get dataIncio {
    return _dataIncio;
  }

  TextEditingController get dataUltAplicacao {
    return _dataUltAplicacao;
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

  TextEditingController get dataAplicacao {
    return _dataAplicacao;
  }

  set apresentacao(apresentacao) {
    _apresentacao.text = apresentacao;
  }

  set data(dataIncio) {
    _dataIncio.text = dataIncio;
  }

  set dataUltAplicacao(dataUltAplicacao) {
    _dataUltAplicacao.text = dataUltAplicacao;
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

  set dataAplicacao(dataAplicacao) {
    _dataAplicacao.text = dataAplicacao;
  }

  bool cicloValidado(CicloModel? model) {
    bool validado = true;

    validado = model?.apresentacao != null &&
        model?.apresentacao != "" &&
        model?.dataIncio != null &&
        model?.dataIncio != "" &&
        model?.medicamento != null &&
        model?.medicamento != "" &&
        model?.dosagem != null &&
        model?.dosagem != "" &&
        (model?.apresentacao.length ?? 0) > 3 &&
        (model?.dataIncio.length ?? 0) > 8 &&
        (model?.medicamento.length ?? 0) > 3 &&
        (model?.dosagem.length ?? 0) > 3;

    return validado;
  }

  Future<List<CicloModel>> buscarTodos(String userUid) async {
    List<CicloModel> lista = [];
    DataSnapshot snapshot = await dao.buscarTodos(userUid);
    Iterable<DataSnapshot> ciclos = snapshot.children;

    for (DataSnapshot ciclo in ciclos) {
      CicloModel model = CicloModel.fromSnapshot(ciclo);
      lista.add(model);
    }

    return lista;
  }

  Future<CicloModel?> buscarCicloAtual() async {
    CicloModel model;

    DataSnapshot snapshot = await dao.buscarCicloAtual();
    Iterable<DataSnapshot> ciclos = snapshot.children;

    for (DataSnapshot ciclo in ciclos) {
      model = CicloModel.fromSnapshot(ciclo);
      if (model.atual) {
        return model;
      }
    }
    return null;
  }

  cadastrar() async {
    CicloModel model = CicloModel();
    model.atual = true;
    model.apresentacao = _apresentacao.text;
    model.dataIncio = _dataIncio.text;
    model.medicamento = _medicamento.text;
    model.dosagem = _dosagem.text;

    if (cicloValidado(model)) {
      model.uid = (await dao.cadastrar(model))!;

      DateTime? ultAplicacao = _dataUltAplicacao.text != ""
          ? DateTime.parse(_dataUltAplicacao.text)
          : null;

      controller.cadastrar(model.uid, int.parse(numAplicacoes.text),
          int.parse(_intervalo.text), model, ultAplicacao);
    }

    return true;
  }

  void registraAplicacao(CicloModel cicloModel) {
    List<AplicacaoModel> restantes = cicloModel.aplicacoes
        .where((element) => element.feito == false)
        .toList();

    if (restantes.length <= 1) {
      finalizarCiclo(cicloModel);
    }

    if (restantes.isNotEmpty) {
      AplicacaoModel aplicacaoModel = restantes.first;
      aplicacaoModel.dataFeito = DateTime.parse(_dataAplicacao.text);
      controller.registrar(aplicacaoModel, cicloModel.userUid);
    }
  }

  void finalizarCiclo(CicloModel cicloModel) {
    cicloModel.atual = false;
    dao.alterar(cicloModel);
  }

  void alterar(CicloModel cicloModel) async {
    CicloModel model = CicloModel();
    model.uid = cicloModel.uid;
    model.userUid = cicloModel.userUid;
    model.aplicacoes = cicloModel.aplicacoes;
    model.atual = true;
    model.apresentacao = _apresentacao.text;
    model.dataIncio = _dataIncio.text;
    model.medicamento = _medicamento.text;
    model.dosagem = _dosagem.text;

    if (cicloValidado(model)) {
      dao.alterar(model);

      DateTime? ultAplicacao = _dataUltAplicacao.text != ""
          ? DateTime.parse(_dataUltAplicacao.text)
          : null;
      controller.alterarAplicacoesCiclo(
          cicloModel,
          int.parse(_numAplicacoes.text),
          int.parse(_intervalo.text),
          ultAplicacao);

      controller.buscar(model.uid).then((value) {
        List<AplicacaoModel> restantes =
            value.where((element) => element.feito == false).toList();
        if (restantes.isEmpty) {
          finalizarCiclo(cicloModel);
        }
      });
    }
  }
}
