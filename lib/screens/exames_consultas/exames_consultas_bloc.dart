import 'package:ariel_app/controller/exame_controller.dart';
import 'package:ariel_app/models/exame_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ExameConsultaBloc extends BlocBase {
  List<ExameModel> listaExames = [];
  ExameController controller = ExameController();

  buscarDados(userUid) async {
    listaExames = await controller.buscarTodos(userUid);
    for (var element in listaExames) {element.userUid = userUid;}
  }
}
