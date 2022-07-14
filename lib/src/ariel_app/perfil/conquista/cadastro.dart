import 'dart:io';

import 'package:ariel_app/core/controller/user_info_controller.dart';
import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/shared/input/campo_data.dart';
import 'package:ariel_app/core/shared/input/campo_imagem.dart';
import 'package:ariel_app/core/shared/input/campo_texto.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class CadastrarConquistaPage extends StatefulWidget {
  final UserInfoController controller = UserInfoController.edicao();
  final UserModel user;

  CadastrarConquistaPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<CadastrarConquistaPage> createState() => _CadastrarConquistaPageState();
}

class _CadastrarConquistaPageState extends State<CadastrarConquistaPage> {
  final double leftPadding = 32;
  File? foto;

  @override
  Widget build(BuildContext context) {
    return DetalheWidget(
      titulo: "PERFIL",
      subTitulo: const ['Nova', ' conquista'],
      color: ArielColors.secundary,
      imgFundo: Image.asset('assets/images/ciclos.png').image,
      child: Material(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.of(context).dynamicScaleSize(
                size: leftPadding,
              ),
              left: SizeConfig.of(context).dynamicScaleSize(
                size: leftPadding,
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CampoImagem(
                photo: foto,
              ),
              CampoTexto(
                label: "TÍTULO",
                controller: widget.controller.nome,
                color: ArielColors.secundary,
                inputPadding: EdgeInsets.only(
                  top: SizeConfig.of(context).dynamicScaleSize(
                    size: 12,
                  ),
                  bottom: SizeConfig.of(context).dynamicScaleSize(
                    size: 12,
                  ),
                ),
              ),
              Texto(
                "DATA",
                color: ArielColors.secundary,
                fontWeight: Weight.semibold,
                size: SizeConfig.of(context).dynamicScaleSize(size: 9),
                padding: EdgeInsets.only(
                  bottom: SizeConfig.of(context).dynamicScaleSize(
                    size: 4,
                  ),
                ),
              ),
              CampoData(
                controller: widget.controller.dtNascimento,
                padding: EdgeInsets.only(
                  bottom: SizeConfig.of(context).dynamicScaleSize(
                    size: 8,
                  ),
                ),
              ),
              CampoTexto(
                label: "DESCRIÇÃO",
                maxLines: 4,
                color: ArielColors.secundary,
                controller: widget.controller.nome,
                inputPadding: EdgeInsets.only(
                  bottom: SizeConfig.of(context).dynamicScaleSize(
                    size: 12,
                  ),
                ),
              ),
            ]),
          ),
          DivisoriaDecorada(
            titulo: "LEMBRETE",
            cor: ArielColors.secundary,
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.of(context).dynamicScaleSize(size: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.of(context).dynamicScaleSize(
                size: leftPadding,
              ),
              left: SizeConfig.of(context).dynamicScaleSize(
                size: leftPadding,
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CampoTexto(
                label: "NOTIFICAR A CADA",
                controller: widget.controller.nome,
                color: ArielColors.secundary,
                inputPadding: EdgeInsets.only(
                  bottom: SizeConfig.of(context).dynamicScaleSize(
                    size: 12,
                  ),
                ),
              ),
              Texto(
                "HORÁRIO DO LEMBRETE",
                color: ArielColors.secundary,
                fontWeight: Weight.semibold,
                size: SizeConfig.of(context).dynamicScaleSize(size: 9),
                padding: EdgeInsets.only(
                  bottom: SizeConfig.of(context).dynamicScaleSize(
                    size: 4,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.of(context).dynamicScaleSize(
                    size: 24,
                  ),
                ),
                child: CampoData(
                  controller: widget.controller.dtNascimento,
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.of(context).dynamicScaleSize(
                      size: 8,
                    ),
                  ),
                ),
              ),
              BotaoPadrao(
                  label: "SALVAR ALTERAÇÕES",
                  height: SizeConfig.of(context).dynamicScaleSize(size: 40),
                  padding: const EdgeInsets.all(0),
                  textStyle: TextStyle(
                      fontSize:
                          SizeConfig.of(context).dynamicScaleSize(size: 12),
                      fontWeight: Weight.bold),
                  internalPadding:
                      SizeConfig.of(context).dynamicScaleSize(size: 8),
                  onPressed: () {}),
            ]),
          ),
        ]),
      ),
    );
  }
}
