import 'package:ariel_app/controller/ciclo_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class CadastroEdicaobloc extends BlocBase {
  late final String userUid;
  late final String? cicloUid;
  final controller = CicloController();

  init(String userUid, String? cicloUid) async {
    this.userUid = userUid;
    this.cicloUid = cicloUid;
  }

  cadastrarEditar(){
    controller.cadastrar();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
