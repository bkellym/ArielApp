import 'package:ariel_app/core/floating_action_capsule.dart';
import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/consulta/cadastro_edicao/cadastro_edicao_widget.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/exame/cadastro_edicao/cadastro_widget.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/exames_consultas_bloc.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/widgets/lista_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExamesConsultasPage extends StatefulWidget {
  final UserModel user;

  const ExamesConsultasPage({Key? key, required this.user}) : super(key: key);

  @override
  State<ExamesConsultasPage> createState() => _ExamesConsultasPageState();
}

class _ExamesConsultasPageState extends State<ExamesConsultasPage>
    with SingleTickerProviderStateMixin {
  final ExameConsultaBloc _bloc = ExameConsultaBloc();
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 260),
      vsync: this,
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _bloc.buscarDados(widget.user.uid),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              floatingActionButton: FloatingActionCapsule(
                iconData: Icons.add,
                animation: _animation,
                iconColor: Colors.white,
                backGroundColor: ArielColors.cicloColor,
                onPress: () => _animationController.isCompleted
                    ? _animationController.reverse()
                    : _animationController.forward(),
                items: <Capsule>[
                  Capsule(
                      icon: Icons.bookmark_border,
                      title: "NOVO EXAME",
                      iconColor: Colors.white,
                      bubbleColor: ArielColors.exameColor,
                      titleStyle: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: Weight.extrabold),
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroExameWidget(
                                      userUid: widget.user.uid,
                                    )));
                      }),
                  Capsule(
                    icon: Icons.bookmark_border,
                    title: "NOVA CONSULTA",
                    iconColor: Colors.white,
                    bubbleColor: ArielColors.consultaColor,
                    titleStyle: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: Weight.extrabold),
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CadastroEdicaoConsulta(
                                  userUid: widget.user.uid)));
                    },
                  ),
                ],
              ),
              body: Column(children: [
                Expanded(
                  child: Column(children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.asset(
                                  'assets/images/header_exames_consultas.png')
                              .image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: SizedBox(
                        height: 110,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 24),
                                  bottom: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 8),
                                ),
                                child: Texto(
                                  "EXAMES E\nCONSULTAS",
                                  size: SizeConfig.of(context)
                                      .dynamicScaleSize(size: 26),
                                  color: Colors.white,
                                  fontWeight: Weight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Expanded(
                      child: _bloc.listaEventos.isNotEmpty
                          ? ListView(children: [
                              ListaItens(
                                titulo:
                                    "Hoje | ${DateFormat("dd 'de' MMMM 'de' yyyy", "pt_BR").format(DateTime.now())}",
                                ativo: true,
                                lista: _bloc.getListHoje(),
                                color: ArielColors.secundary,
                              ),
                              ListaItens(
                                titulo:
                                    "Esse mês | ${DateFormat("MMMM 'de' yyyy", "pt_BR").format(
                                  DateTime(DateTime.now().year,
                                      DateTime.now().month, 1),
                                )}",
                                ativo: true,
                                lista: _bloc.getListMes(),
                                color: ArielColors.textPrimary,
                              ),
                              ListaItens(
                                titulo:
                                    "Próximo Mês | ${DateFormat("MMMM 'de' yyyy", "pt_BR").format(
                                  DateTime(DateTime.now().year,
                                      DateTime.now().month + 1, 1),
                                )}",
                                ativo: true,
                                lista: _bloc.getProxMes(),
                                color: ArielColors.textPrimary,
                              ),
                              ListaItens(
                                titulo: "Próximos",
                                ativo: true,
                                lista: _bloc.getFuturo(),
                                color: ArielColors.textPrimary,
                              ),
                              ListaItens(
                                titulo: "Histórico",
                                lista: _bloc.getPassados(),
                                color: ArielColors.textPrimary,
                              ),
                            ])
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Texto(
                                    "VOCÊ AINDA NÃO POSSUI EXAMES NEM CONSULTAS CADASTRADOS",
                                    color: ArielColors.textLight,
                                    fontWeight: Weight.semibold,
                                    padding: EdgeInsets.symmetric(vertical: 32),
                                    size: 12,
                                  )
                                ]),
                    ),
                  ]),
                ),
              ]),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
