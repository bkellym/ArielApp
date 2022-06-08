// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

class BotaoPadrao extends StatefulWidget {
  final VoidCallback? onPressed;
  final String label;

  BotaoPadrao({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final LinearGradient gradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      ArielColors.primary,
      ArielColors.primaryLight,
    ],
  );

  final ButtonStyle buttontheme = ElevatedButton.styleFrom(
    primary: Colors.transparent,
    onPrimary: Colors.white,
    onSurface: Colors.transparent,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    textStyle: const TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  _BotaoPadraoState createState() => _BotaoPadraoState();
}

class _BotaoPadraoState extends State<BotaoPadrao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 16,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ElevatedButton(
          style: widget.buttontheme,
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 64,
              right: 64,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
