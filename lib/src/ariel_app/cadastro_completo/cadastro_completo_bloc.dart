import 'package:ariel_app/core/controller/ciclo_controller.dart';
import 'package:ariel_app/core/controller/resultado_exame_controller.dart';
import 'package:ariel_app/core/controller/user_info_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CadastroCompletoBloc extends BlocBase {
  List<String> listaGeneros = [];
  final FirebaseStorage storage = FirebaseStorage.instance;

  final cicloController = CicloController();
  final userController = UserInfoController(FirebaseAuth.instance.currentUser);
  final resultExameController = ResultadoExameController();

  init() async {
    listaGeneros.addAll(userController.generos.values.toList());
    return true;
  }

  void cadastrar() async {
    userController.cadastrar();
    cicloController.cadastrar();
    resultExameController.cadastrar();
  }
}
