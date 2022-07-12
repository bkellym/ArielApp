import 'package:ariel_app/components/mensagem_erro.dart';
import 'package:ariel_app/core/controller/ciclo_controller.dart';
import 'package:ariel_app/core/controller/resultado_exame_controller.dart';
import 'package:ariel_app/core/controller/user_info_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

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
    String? stringFoto = await _uploadFile();
    userController.cadastrar(stringFoto);
    cicloController.cadastrar();
    resultExameController.cadastrar();
  }

  Future<String?> _uploadFile() async {
    if (userController.foto == null) return null;
    final fileName = basename(userController.foto!.path);
    final destination = 'files/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(userController.foto!);
      return await ref.getDownloadURL();
    } catch (e) {
      MensagemErro(mensagem: 'Não foi possível carregar a imagem');
    }
    return null;
  }
}
