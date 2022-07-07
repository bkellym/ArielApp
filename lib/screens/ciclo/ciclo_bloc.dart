import 'package:ariel_app/controller/ciclo_controller.dart';
import 'package:ariel_app/models/ciclo_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class CicloBloc extends BlocBase {
  List<CicloModel> ciclosAtuais = [];
  List<CicloModel> historicoCiclos = [];

  CicloController controller = CicloController();

  buscarDados(userUid) async {
    ciclosAtuais = [];
    historicoCiclos = [];
    List<CicloModel> ciclos = await controller.buscarTodos(userUid);
    ciclos.sort((a, b) =>
        DateTime.parse(a.dataIncio).compareTo(DateTime.parse(b.dataIncio)));
    for (CicloModel ciclo in ciclos) {
      ciclo.userUid = userUid;
      if (ciclo.atual) {
        ciclosAtuais.add(ciclo);
      } else {
        historicoCiclos.add(ciclo);
      }
    }
  }
}
