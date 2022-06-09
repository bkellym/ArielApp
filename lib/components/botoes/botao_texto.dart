// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

class BotaoTexto extends StatefulWidget {
  final VoidCallback? onPressed;
  final String label;

  const BotaoTexto({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  _BotaoTextoState createState() => _BotaoTextoState();
}

class _BotaoTextoState extends State<BotaoTexto> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.label,
        style: const TextStyle(
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w600,
          color: ArielColors.textPrimary,
        ),
      ),
    );
  }
}
