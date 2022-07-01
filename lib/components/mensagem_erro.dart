// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:flutter/material.dart';

class MensagemErro extends SnackBar {
  final String mensagem;

  MensagemErro({
    Key? key,
    required this.mensagem,
  }) : super(
          key: key,
          content: MensagemErroContent(mensagem: mensagem),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent.withOpacity(0),
          elevation: 0,
        );
}

class MensagemErroContent extends StatelessWidget {
  final String mensagem;

  const MensagemErroContent({Key? key, required this.mensagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ArielColors.arielRed.withOpacity(0.95),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      padding: const EdgeInsets.all(16),
      child: Text(mensagem),
    );
  }
}
