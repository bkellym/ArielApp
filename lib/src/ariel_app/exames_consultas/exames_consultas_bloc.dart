import 'package:ariel_app/core/controller/consulta_controller.dart';
import 'package:ariel_app/core/controller/exame_controller.dart';
import 'package:ariel_app/core/models/consulta_model.dart';
import 'package:ariel_app/core/models/exame_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ExameConsultaBloc extends BlocBase {
  List<ExameModel> listaExames = [];
  List<ConsultaModel> listaConsultas = [];
  ExameController exameController = ExameController();
  ConsultaController consultaController = ConsultaController();

  buscarDados(userUid) async {
    listaExames = await exameController.buscarTodos(userUid);
    for (var element in listaExames) {
      element.userUid = userUid;
    }

    listaConsultas = await consultaController.buscarTodos(userUid);
    for (var element in listaConsultas) {
      element.userUid = userUid;
    }
  }
}
