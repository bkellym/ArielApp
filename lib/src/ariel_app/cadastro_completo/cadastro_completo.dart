import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/inputs.dart';
import 'package:ariel_app/core/shared/input/campo_radio.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
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
  final CadastroCompletoBloc _bloc = CadastroCompletoBloc();

  @override
  Widget build(BuildContext context) {
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Texto(
                                  "Olá ${_bloc.userController.nome.text}",
                                  size: 22,
                                  color: ArielColors.baseLight,
                                ),
                                Texto(
                                  "Vamos Completar seu perfil?".toUpperCase(),
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
                        padding: EdgeInsets.only(
                          top: 16,
                          bottom: 32,
                          left: 12,
                        ),
                      ),
                      CampoImagem(
                        onChange: (foto) {
                          _bloc.userController.foto = foto;
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CampoTexto(
                            label: 'NOME',
                            controller: _bloc.userController.nome,
                            inputPadding: EdgeInsets.only(
                              left: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              right: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              bottom: SizeConfig.of(context).dynamicScaleSize(
                                size: 12,
                              ),
                            ),
                          ),
                          CampoTexto(
                            label: 'E-MAIL',
                            controller: _bloc.userController.email,
                            inputPadding: EdgeInsets.only(
                              left: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              right: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              bottom: SizeConfig.of(context).dynamicScaleSize(
                                size: 12,
                              ),
                            ),
                          ),
                          CampoData(
                            label: 'DATA DE NASCIMENTO',
                            inputPadding: EdgeInsets.only(
                              left: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              right: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              bottom: SizeConfig.of(context).dynamicScaleSize(
                                size: 12,
                              ),
                            ),
                            controller: _bloc.userController.dtNascimento,
                          ),
                          CampoRadio(
                            valores: _bloc.generos,
                            onChange: (val) {
                              _bloc.userController.genero = val!;
                            },
                          ),
                          CampoTexto(
                            label: "SUA HISTÓRIA",
                            controller: _bloc.userController.historia,
                            maxLines: 8,
                            inputPadding: EdgeInsets.only(
                              left: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              right: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              bottom: SizeConfig.of(context).dynamicScaleSize(
                                size: 12,
                              ),
                            ),
                          ),
                          const DivisoriaDecorada(
                            titulo: "SEU CICLO DE TRATAMENTO ATUAL",
                            cor: ArielColors.secundary,
                            padding: EdgeInsets.only(
                              top: 16,
                              bottom: 32,
                              left: 12,
                            ),
                          ),
                          CampoTexto(
                            controller: _bloc.cicloController.medicamento,
                            label: "MEDICAMENTO UTILIZADO",
                            inputPadding: EdgeInsets.only(
                              left: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              right: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              bottom: SizeConfig.of(context).dynamicScaleSize(
                                size: 12,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 7,
                                child: CampoData(
                                  label: 'DATA DE INÍCIO',
                                  inputPadding: EdgeInsets.only(
                                    left:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 24,
                                    ),
                                    right:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 24,
                                    ),
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 12,
                                    ),
                                  ),
                                  controller: _bloc.cicloController.dataIncio,
                                  color: ArielColors.secundary,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: CampoTexto(
                                  label: 'INTERVALO',
                                  controller: _bloc.cicloController.intervalo,
                                  textInputType: TextInputType.number,
                                  inputPadding: EdgeInsets.only(
                                    left:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 8,
                                    ),
                                    right:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 24,
                                    ),
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: CampoTexto(
                                  controller: _bloc.cicloController.dosagem,
                                  label: 'DOSAGEM',
                                  inputPadding: EdgeInsets.only(
                                    left:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 24,
                                    ),
                                    right:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 8,
                                    ),
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: CampoTexto(
                                  label: 'APRESENTAÇÃO',
                                  controller:
                                      _bloc.cicloController.apresentacao,
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: CampoTexto(
                                  label: "QTD. POR CICLO",
                                  controller:
                                      _bloc.cicloController.numAplicacoes,
                                  textInputType: TextInputType.number,
                                  inputPadding: EdgeInsets.only(
                                    left:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 8,
                                    ),
                                    right:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 24,
                                    ),
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CampoData(
                            label: 'DATA DA ÚLTIMA APLICAÇÃO / TOMADA',
                            inputPadding: EdgeInsets.only(
                              left: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              right: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              bottom: SizeConfig.of(context).dynamicScaleSize(
                                size: 12,
                              ),
                            ),
                            controller: _bloc.userController.dtUltAplicacao,
                          ),
                          const DivisoriaDecorada(
                            titulo: "DADOS DO SEU ÚLTIMO EXAME",
                            cor: ArielColors.secundary,
                            padding: EdgeInsets.only(
                              top: 16,
                              left: 12,
                            ),
                          ),
                          CampoTexto(
                            controller: _bloc.resultExameController.nome,
                            label: 'TIPO DE EXAME',
                            inputPadding: EdgeInsets.only(
                              left: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              right: SizeConfig.of(context).dynamicScaleSize(
                                size: 24,
                              ),
                              bottom: SizeConfig.of(context).dynamicScaleSize(
                                size: 12,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: SizeConfig.of(context)
                                                .dynamicScaleSize(size: 24),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: CampoTexto(
                                            label: 'DOSAGEM SÉRICA',
                                            controller: _bloc
                                                .resultExameController.dosagem,
                                            textInputType: TextInputType.number,
                                            inputPadding: EdgeInsets.only(
                                              left: SizeConfig.of(context)
                                                  .dynamicScaleSize(
                                                size: 0,
                                              ),
                                              right: SizeConfig.of(context)
                                                  .dynamicScaleSize(
                                                size: 8,
                                              ),
                                              bottom: SizeConfig.of(context)
                                                  .dynamicScaleSize(
                                                size: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Texto(
                                          "ng/dl",
                                          size: 12,
                                          color: ArielColors.secundary,
                                          fontWeight: Weight.semibold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: CampoData(
                                  label: 'DATA DO EXAME',
                                  inputPadding: EdgeInsets.only(
                                    left:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 24,
                                    ),
                                    right:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 24,
                                    ),
                                    bottom:
                                        SizeConfig.of(context).dynamicScaleSize(
                                      size: 12,
                                    ),
                                  ),
                                  controller: _bloc.resultExameController.data,
                                ),
                              )
                            ],
                          ),
                          BotaoPadrao(
                            label: "Salvar Perfil",
                            onPressed: () async {
                              _bloc.cadastrar();
                              Navigator.pushNamed(context, '/inicio');
                            },
                          ),
                        ],
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
  }
}
