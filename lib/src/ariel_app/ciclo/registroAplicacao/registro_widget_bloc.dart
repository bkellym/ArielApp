import 'package:ariel_app/core/controller/ciclo_controller.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class RegistroAplicacaoBloc extends BlocBase {
  CicloController controller = CicloController();

  registrar(CicloModel cicloModel) {
    controller.registraAplicacao(cicloModel);
  }
}
