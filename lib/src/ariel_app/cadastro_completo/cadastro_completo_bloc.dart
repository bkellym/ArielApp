import 'package:ariel_app/core/controller/ciclo_controller.dart';
import 'package:ariel_app/core/controller/resultado_exame_controller.dart';
import 'package:ariel_app/core/controller/user_info_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CadastroCompletoBloc extends BlocBase {
  final FirebaseStorage storage = FirebaseStorage.instance;

  final cicloController = CicloController();
  final userController = UserInfoController(FirebaseAuth.instance.currentUser);
  final resultExameController = ResultadoExameController();

  List<Map> generos = [
    {'id': 'M', 'titulo': 'Masculino'},
    {'id': 'F', 'titulo': 'Feminino'},
    {'id': 'N', 'titulo': 'Não-Binário'},
  ];

  void cadastrar() async {
    userController.cadastrar();
    cicloController.cadastrar();
    resultExameController.cadastrar();
  }
}
