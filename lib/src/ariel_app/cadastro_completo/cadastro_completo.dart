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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "NOME",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          CampoTexto(
                            controller: _bloc.userController.nome,
                            label: '',
                            leftPadding: 24,
                            rightPadding: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "E-MAIL",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          CampoTexto(
                            controller: _bloc.userController.email,
                            label: '',
                            leftPadding: 24,
                            rightPadding: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "DATA DE NASCIMENTO",
                              size: 12,
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "SUA HISTÓRIA",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          CampoTexto(
                            controller: _bloc.userController.historia,
                            maxLines: 8,
                            leftPadding: 24,
                            rightPadding: 24,
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "MEDICAMENTO UTILIZADO",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          CampoTexto(
                            controller: _bloc.cicloController.medicamento,
                            label: '',
                            leftPadding: 24,
                            rightPadding: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                width: MediaQuery.of(context).size.width * 0.7,
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
                                        size: 12,
                                        color: ArielColors.secundary,
                                        fontWeight: Weight.semibold,
                                      ),
                                    ),
                                    CampoData(
                                      controller:
                                          _bloc.cicloController.dataIncio,
                                      padding: const EdgeInsets.only(
                                        left: 24,
                                        right: 8,
                                        bottom: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.zero,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 24,
                                        bottom: 8,
                                      ),
                                      child: Texto(
                                        "INTERVALO",
                                        size: 12,
                                        color: ArielColors.secundary,
                                        fontWeight: Weight.semibold,
                                      ),
                                    ),
                                    CampoTexto(
                                      rightPadding: 24,
                                      bottomPadding: 8,
                                      controller:
                                          _bloc.cicloController.intervalo,
                                      textInputType: TextInputType.number,
                                      label: '',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24,
                                        bottom: 8,
                                      ),
                                      child: Texto(
                                        "DOSAGEM",
                                        size: 12,
                                        color: ArielColors.secundary,
                                        fontWeight: Weight.semibold,
                                      ),
                                    ),
                                    CampoTexto(
                                      controller: _bloc.cicloController.dosagem,
                                      label: '',
                                      leftPadding: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.zero,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        bottom: 8,
                                      ),
                                      child: Texto(
                                        "APRESENTAÇÃO",
                                        size: 12,
                                        color: ArielColors.secundary,
                                        fontWeight: Weight.semibold,
                                      ),
                                    ),
                                    CampoTexto(
                                      controller:
                                          _bloc.cicloController.apresentacao,
                                      label: '',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.zero,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 24,
                                        bottom: 8,
                                      ),
                                      child: Texto(
                                        "QTD. POR CICLO",
                                        size: 12,
                                        color: ArielColors.secundary,
                                        fontWeight: Weight.semibold,
                                      ),
                                    ),
                                    CampoTexto(
                                      rightPadding: 24,
                                      controller:
                                          _bloc.cicloController.numAplicacoes,
                                      textInputType: TextInputType.number,
                                      label: '',
                                    ),
                                  ],
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
                              size: 12,
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "TIPO DE EXAME",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          CampoTexto(
                            controller: _bloc.resultExameController.nome,
                            label: '',
                            leftPadding: 24,
                            rightPadding: 24,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24,
                                        bottom: 8,
                                      ),
                                      child: Texto(
                                        "DOSAGEM SÉRICA",
                                        size: 12,
                                        color: ArielColors.secundary,
                                        fontWeight: Weight.semibold,
                                      ),
                                    ),
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
                                            bottomPadding: 8,
                                            controller: _bloc
                                                .resultExameController.dosagem,
                                            textInputType: TextInputType.number,
                                            label: '',
                                            leftPadding: 0,
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
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
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
                                        size: 12,
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
