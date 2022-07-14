import 'package:ariel_app/core/controller/consulta_controller.dart';
import 'package:ariel_app/core/controller/exame_controller.dart';
import 'package:ariel_app/core/models/consulta_model.dart';
import 'package:ariel_app/core/models/exame_model.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:intl/intl.dart';

class ExameConsultaBloc extends BlocBase {
  List<ExameModel> listaExames = [];
  List<ConsultaModel> listaConsultas = [];
  List<Map<String, dynamic>> listaEventos = [];
  ExameController exameController = ExameController();
  ConsultaController consultaController = ConsultaController();

  buscarDados(userUid) async {
    listaEventos = [];

    try {
      listaExames = await exameController.buscarTodos(userUid);
      for (var element in listaExames) {
        element.userUid = userUid;
        addToList(element);
      }

      listaConsultas = await consultaController.buscarTodos(userUid);
      for (var element in listaConsultas) {
        element.userUid = userUid;
        addToList(element);
      }

      listaEventos = _ordernarLista(listaEventos);
    } catch (e) {
      print(e.toString());
    }
  }

  List<Map<String, dynamic>> getPassados() {
    List<Map<String, dynamic>> lista = listaEventos;

    lista = lista.where((element) {
      DateTime data = _getData(element['model']);
      DateTime hoje = DateTime.now();

      return data.isBefore(hoje);
    }).toList();

    lista = _ordernarLista(lista, desc: true);

    return lista;
  }

  List<Map<String, dynamic>> getListHoje() {
    List<Map<String, dynamic>> lista = listaEventos;

    print(DateTime.now());

    lista = lista.where((element) {
      DateTime data = _getData(element['model']);
      DateTime hoje = DateTime.now();

      return data.day == hoje.day &&
          data.month == hoje.month &&
          data.year == hoje.year;
    }).toList();

    return lista;
  }

  List<Map<String, dynamic>> getListMes() {
    List<Map<String, dynamic>> lista = listaEventos;

    lista = lista.where((element) {
      DateTime data = _getData(element['model']);
      DateTime hoje = DateTime.now();

      return data.day > hoje.day &&
          data.month == hoje.month &&
          data.year == hoje.year;
    }).toList();

    return lista;
  }

  List<Map<String, dynamic>> getProxMes() {
    List<Map<String, dynamic>> lista = listaEventos;

    lista = lista.where((element) {
      DateTime data = _getData(element['model']);
      DateTime hoje = DateTime.now();

      return data.month == hoje.month + 1 && data.year == hoje.year;
    }).toList();

    return lista;
  }

  List<Map<String, dynamic>> getFuturo() {
    List<Map<String, dynamic>> lista = listaEventos;

    lista = lista.where((element) {
      DateTime data = _getData(element['model']);
      DateTime hoje = DateTime.now();

      return data.month > hoje.month + 1 && data.year == hoje.year;
    }).toList();

    return lista;
  }

  DateTime _getData(objeto) {
    return objeto.dataHora;
  }

  List<Map<String, dynamic>> _ordernarLista(List<Map<String, dynamic>> lista,
      {bool desc = false}) {
    lista.sort((a, b) {
      DateTime dataA = _getData(a['model']);
      DateTime dataB = _getData(b['model']);

      if (desc) {
        return dataB.compareTo(dataA);
      } else {
        return dataA.compareTo(dataB);
      }
    });

    return lista;
  }

  addToList(objeto) {
    Map<String, dynamic> mapa = {};

    mapa['titulo'] = objeto is ExameModel
        ? objeto.tipo
        : (objeto as ConsultaModel).especialidade;

    mapa['dataHora'] = objeto is ExameModel
        ? objeto.dataHora
        : (objeto as ConsultaModel).dataHora;

    mapa['color'] = objeto is ExameModel
        ? ArielColors.exameColor
        : ArielColors.consultaColor;

    mapa['background'] = objeto is ExameModel
        ? ArielColors.exameFundoColor
        : ArielColors.consultaFundoColor;

    mapa['model'] = objeto;

    listaEventos.add(mapa);
  }
}
