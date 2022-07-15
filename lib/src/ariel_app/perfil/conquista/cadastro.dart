import 'dart:io';

import 'package:ariel_app/core/inputs.dart';
import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class CadastrarConquistaPage extends StatefulWidget {
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CampoImagem(
              onChange: (foto) {
                this.foto = foto;
              },
            ),
            const CampoTexto(
              label: "TÍTULO",
              color: ArielColors.secundary,
            ),
            const CampoData(
              label: "DATA",
            ),
            const CampoTexto(
              label: "DESCRIÇÃO",
              maxLines: 4,
              color: ArielColors.secundary,
            ),
          ]),
          DivisoriaDecorada(
            titulo: "LEMBRETE",
            cor: ArielColors.secundary,
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.of(context).dynamicScaleSize(size: 16),
            ),
          ),
          const CampoTexto(
            label: "NOTIFICAR A CADA",
            color: ArielColors.secundary,
          ),
          const CampoHora(
            "HORÁRIO DO LEMBRETE",
          ),
          const Divisoria(),
          BotaoPadrao(
              label: "SALVAR ALTERAÇÕES",
              height: SizeConfig.of(context).dynamicScaleSize(size: 40),
              padding: const EdgeInsets.all(0),
              textStyle: TextStyle(
                  fontSize: SizeConfig.of(context).dynamicScaleSize(size: 12),
                  fontWeight: Weight.bold),
              internalPadding: SizeConfig.of(context).dynamicScaleSize(size: 8),
              onPressed: () {}),
        ]),
      ),
    );
  }
}
