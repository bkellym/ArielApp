import 'package:ariel_app/DAO/consulta_dao.dart';
import 'package:ariel_app/models/consulta_model.dart';
import 'package:ariel_app/models/exame_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ConsultaController {
  ConsultaDAO dao = ConsultaDAO();

  final TextEditingController _especialidade = TextEditingController();
  final TextEditingController _data = TextEditingController();
  final TextEditingController _hora = TextEditingController();
  final TextEditingController _medico = TextEditingController();
  final TextEditingController _endereco = TextEditingController();
  final TextEditingController _detalhes = TextEditingController();

  TextEditingController get especialidade {
    return _especialidade;
  }

  TextEditingController get data {
    return _data;
  }

  TextEditingController get hora {
    return _hora;
  }

  TextEditingController get medico {
    return _medico;
  }

  TextEditingController get endereco {
    return _endereco;
  }

  TextEditingController get detalhes {
    return _detalhes;
  }

  set especialidade(especialidade) {
    _especialidade.text = especialidade;
  }

  set data(data) {
    _data.text = data;
  }

  set hora(hora) {
    _hora.text = hora;
  }

  set medico(medico) {
    _medico.text = medico;
  }

  set endereco(endereco) {
    _endereco.text = endereco;
  }

  set detalhes(detalhes) {
    _detalhes.text = detalhes;
  }

  Future<List<ConsultaModel>> buscarTodos(String userUid) async {
    List<ConsultaModel> lista = [];
    DataSnapshot snapshot = await dao.buscarTodos(userUid);
    Iterable<DataSnapshot> listaSnapshots = snapshot.children;

    for (DataSnapshot snapData in listaSnapshots) {
      ConsultaModel model = ConsultaModel.fromSnapshot(snapData);
      lista.add(model);
    }

    return lista;
  }

  void cadastrar(String userUid) {
    ConsultaModel model = ConsultaModel();
    model.userUid = userUid;
    model.especialidade = _especialidade.text;
    model.dataHora = DateTime.parse(
        "${_data.text != "" ? _data.text : ""} ${_hora.text != "" ? "${_hora.text}:00" : ""}");
    model.medico = _medico.text;
    model.endereco = _endereco.text;
    model.detalhes = _detalhes.text;

    dao.cadastrar(model);
  }

  void alterar(ConsultaModel model) {
    model.especialidade = _especialidade.text;
    model.dataHora = DateTime.parse(
        "${_data.text != "" ? _data.text : ""} ${_hora.text != "" ? "${_hora.text}:00" : ""}");
    model.medico = _medico.text;
    model.endereco = _endereco.text;
    model.detalhes = _detalhes.text;

    dao.alterar(model);
  }
}
