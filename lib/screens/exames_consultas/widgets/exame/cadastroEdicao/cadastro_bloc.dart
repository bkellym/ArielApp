import 'package:ariel_app/controller/exame_controller.dart';
import 'package:ariel_app/models/exame_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ExameBloc extends BlocBase {
  ExameController controller = ExameController();

  init(ExameModel? exameModel){
    if(exameModel != null){
      controller.tipo.text = exameModel.tipo;
      controller.data = exameModel.dataHora;
      controller.hora = exameModel.dataHora;
      controller.local = exameModel.local;
      controller.local = exameModel.detalhes;
    }
  }
}
