import 'package:ariel_app/controller/consulta_controller.dart';
import 'package:ariel_app/models/consulta_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:intl/intl.dart';

class ConsultaBloc extends BlocBase {
  ConsultaController controller = ConsultaController();

  init(ConsultaModel? model) async {
    if (model == null) return null;

    controller.especialidade = model.especialidade;
    controller.data = DateFormat("y-mm-dd").format(model.dataHora);
    controller.hora = DateFormat("HH:mm").format(model.dataHora);
    controller.medico = model.medico;
    controller.endereco = model.endereco;
    controller.detalhes = model.detalhes;
  }

  cadastrarEditar(String userUid, ConsultaModel? consultaModel) {
    if (consultaModel == null) {
      controller.cadastrar(userUid);
    } else {
      controller.alterar(consultaModel);
    }
  }
}
