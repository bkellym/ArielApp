import 'package:ariel_app/controller/exame_controller.dart';
import 'package:ariel_app/models/exame_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:intl/intl.dart';

class ExameBloc extends BlocBase {
  ExameController controller = ExameController();

  init(ExameModel? exameModel) async{
    if(exameModel == null) return null;

    controller.tipo.text = exameModel.tipo;
    controller.data = DateFormat("y-mm-dd").format(exameModel.dataHora);
    controller.hora = DateFormat("HH:mm").format(exameModel.dataHora);
    controller.local = exameModel.local;
    controller.detalhes = exameModel.detalhes;
  }

  cadastrarEditar(String userUid, ExameModel? exameModel){
    if(exameModel == null){
      controller.cadastrar(userUid);
    } else {
      controller.alterar(exameModel);
    }
  }
}
