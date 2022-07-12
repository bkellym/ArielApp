import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/divisoria_decorada.dart';
import 'package:ariel_app/components/input/campo_data.dart';
import 'package:ariel_app/components/input/campo_imagem.dart';
import 'package:ariel_app/components/input/campo_radio.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
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
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 12,
                        ),
                        child: Texto(
                          "SOBRE VOCÊ",
                          size: 12,
                          color: ArielColors.secundary,
                          fontWeight: Weight.bold,
                        ),
                      ),
                      const DivisoriaDecorada(cor: ArielColors.secundary),
                      CampoImagem(
                        photo: _bloc.userController.foto,
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "DATA DE NASCIMENTO",
                              size: SizeConfig.of(context).dynamicScaleSize(
                                size: 9,
                              ),
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          CampoData(
                            controller: _bloc.userController.dtNascimento,
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 8,
                            ),
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
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              left: 12,
                            ),
                            child: Texto(
                              "SEU CICLO DE TRATAMENTO ATUAL",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.bold,
                            ),
                          ),
                          const DivisoriaDecorada(cor: ArielColors.secundary),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24,
                                        bottom: 8,
                                      ),
                                      child: Texto(
                                        "DATA DE INÍCIO",
                                        size: SizeConfig.of(context)
                                            .dynamicScaleSize(
                                          size: 9,
                                        ),
                                        color: ArielColors.secundary,
                                        fontWeight: Weight.semibold,
                                      ),
                                    ),
                                    CampoData(
                                      controller:
                                          _bloc.cicloController.dataIncio,
                                      color: ArielColors.secundary,
                                      padding: const EdgeInsets.only(
                                        left: 24,
                                        right: 8,
                                        bottom: 8,
                                      ),
                                    ),
                                  ],
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "DATA DA ÚLTIMA APLICAÇÃO / TOMADA",
                              size: SizeConfig.of(context).dynamicScaleSize(
                                size: 9,
                              ),
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          CampoData(
                            controller: _bloc.userController.dtUltAplicacao,
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 8,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              left: 12,
                            ),
                            child: Texto(
                              "DADOS DO SEU ÚLTIMO EXAME",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.bold,
                            ),
                          ),
                          const DivisoriaDecorada(cor: ArielColors.secundary),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0,
                                        right: 24,
                                        bottom: 8,
                                      ),
                                      child: Texto(
                                        "DATA DO EXAME",
                                        size: SizeConfig.of(context)
                                            .dynamicScaleSize(
                                          size: 9,
                                        ),
                                        color: ArielColors.secundary,
                                        fontWeight: Weight.semibold,
                                      ),
                                    ),
                                    CampoData(
                                      padding: const EdgeInsets.only(
                                        left: 24,
                                        right: 24,
                                        bottom: 8,
                                      ),
                                      controller:
                                          _bloc.resultExameController.data,
                                    ),
                                  ],
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
