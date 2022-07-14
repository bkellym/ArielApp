import 'package:ariel_app/core/DAO/exame_dao.dart';
import 'package:ariel_app/core/models/exame_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ExameController {
  ExameDAO dao = ExameDAO();

  final TextEditingController _tipo = TextEditingController();
  final TextEditingController _data = TextEditingController();
  final TextEditingController _hora = TextEditingController();
  final TextEditingController _local = TextEditingController();
  final TextEditingController _detalhes = TextEditingController();

  TextEditingController get tipo {
    return _tipo;
  }

  TextEditingController get data {
    return _data;
  }

  TextEditingController get hora {
    return _hora;
  }

  TextEditingController get local {
    return _local;
  }

  TextEditingController get detalhes {
    return _detalhes;
  }

  set tipo(tipo) {
    _tipo.text = tipo;
  }

  set data(data) {
    _data.text = data;
  }

  set hora(hora) {
    _hora.text = hora;
  }

  set local(local) {
    _local.text = local;
  }

  set detalhes(detalhes) {
    _detalhes.text = detalhes;
  }

  Future<ExameModel?> buscarProxima(String userUid) async {
    List<ExameModel> lista = await buscarTodos(userUid);

    if (lista.isEmpty) return null;
    lista.sort((a, b) => a.dataHora.compareTo(b.dataHora));
    lista = lista.where((element) => element.dataHora.isAfter(DateTime.now())).toList();
    ExameModel model = lista.first;
    return model;
  }

  Future<List<ExameModel>> buscarTodos(String userUid) async {
    List<ExameModel> lista = [];
    DataSnapshot snapshot = await dao.buscarTodos(userUid);
    Iterable<DataSnapshot> listaSnapshots = snapshot.children;

    for (DataSnapshot snapData in listaSnapshots) {
      ExameModel model = ExameModel.fromSnapshot(snapData);
      model.userUid = userUid;
      lista.add(model);
    }

    return lista;
  }

  void cadastrar(String userUid) {
    ExameModel model = ExameModel();
    model.userUid = userUid;
    model.tipo = _tipo.text;
    model.dataHora = DateTime.parse(
        "${_data.text != "" ? _data.text : ""} ${_hora.text != "" ? "${_hora.text}:00" : ""}");
    model.local = _local.text;
    model.detalhes = _detalhes.text;

    dao.cadastrar(model);
  }

  void alterar(ExameModel model) {
    model.tipo = _tipo.text;
    model.dataHora = DateTime.parse(
        "${_data.text != "" ? _data.text : ""} ${_hora.text != "" ? "${_hora.text}:00" : ""}");
    model.local = _local.text;
    model.detalhes = _detalhes.text;

    dao.alterar(model);
  }
}
