import 'package:ariel_app/core/inputs.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/ariel_app.dart';
import 'package:ariel_app/src/ariel_app/cadastro_completo/cadastro_completo_bloc.dart';
import 'package:flutter/material.dart';

class CadastroCompleto extends StatefulWidget {
  const CadastroCompleto({Key? key}) : super(key: key);

  @override
  State<CadastroCompleto> createState() {
    return _FormCadastroCompleto();
  }
}

class _FormCadastroCompleto extends State<CadastroCompleto> {
  late final _dadosCarregados;
  final CadastroCompletoBloc _bloc = CadastroCompletoBloc();

  @override
  void initState() {
    _dadosCarregados = _bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dadosCarregados,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Material(
              color: ArielColors.baseLight,
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: ArielColors.baseLight,
                    ),
                    child: Expanded(
                      child: Column(
                        children: [
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Color(0xFF1CE8B4),
                                  Color(0xFF1CC2EB),
                                ],
                              ),
                            ),
                            child: SizedBox(
                              height: 110,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.of(context)
                                          .dynamicScaleSize(size: 8),
                                      bottom: SizeConfig.of(context)
                                          .dynamicScaleSize(size: 24),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Texto(
                                          "Olá ${_bloc.userController.nome.text}",
                                          size: 22,
                                          color: ArielColors.baseLight,
                                        ),
                                        Texto(
                                          "Vamos Completar seu perfil?"
                                              .toUpperCase(),
                                          size: 12,
                                          color: ArielColors.baseLight,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const DivisoriaDecorada(
                                  titulo: "SOBRE VOCÊ",
                                  cor: ArielColors.secundary,
                                  padding: EdgeInsets.symmetric(vertical: 24)),
                              CampoImagem(
                                onChange: (foto) {
                                  _bloc.userController.foto = foto;
                                },
                              ),
                              CampoTexto(
                                label: 'NOME',
                                controller: _bloc.userController.nome,
                              ),
                              CampoTexto(
                                label: 'E-MAIL',
                                controller: _bloc.userController.email,
                              ),
                              CampoData(
                                label: 'DATA DE NASCIMENTO',
                                controller: _bloc.userController.dtNascimento,
                              ),
                              CampoDropdown(
                                label: "GÊNERO",
                                items: _bloc.listaGeneros,
                                controller: _bloc.userController.genero,
                              ),
                              CampoTexto(
                                label: "SUA HISTÓRIA",
                                controller: _bloc.userController.historia,
                                maxLines: 4,
                              ),
                              const DivisoriaDecorada(
                                  titulo: "SEU CICLO DE TRATAMENTO ATUAL",
                                  cor: ArielColors.secundary,
                                  padding: EdgeInsets.symmetric(vertical: 24)),
                              CampoTexto(
                                controller: _bloc.cicloController.medicamento,
                                label: "MEDICAMENTO",
                              ),
                              CampoTexto(
                                controller: _bloc.cicloController.dosagem,
                                label: 'DOSAGEM',
                              ),
                              CampoTexto(
                                label: 'APRESENTAÇÃO',
                                controller: _bloc.cicloController.apresentacao,
                              ),
                              CampoData(
                                label: 'DATA DE INÍCIO',
                                controller: _bloc.cicloController.dataIncio,
                                color: ArielColors.secundary,
                              ),
                              CampoTexto(
                                label: "DOSES TOTAIS DO CICLO",
                                controller: _bloc.cicloController.numAplicacoes,
                                textInputType: TextInputType.number,
                              ),
                              CampoTexto(
                                label: 'INTERVALO DO CICLO',
                                controller: _bloc.cicloController.intervalo,
                                textInputType: TextInputType.number,
                              ),
                              CampoData(
                                label: 'DATA DA ÚLTIMA DOSE',
                                controller: _bloc.userController.dtUltAplicacao,
                              ),
                              BotaoPadrao(
                                label: "Salvar Perfil",
                                onPressed: () {
                                  _bloc.cadastrar();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ArielApp(
                                              tela: 0,
                                            )),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: ArielColors.cicloColor,
              ),
            );
          }
        });
  }
}
