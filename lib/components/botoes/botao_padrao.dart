// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:flutter/material.dart';

class BotaoPadrao extends StatefulWidget {
  final bool disabled;
  final String label;
  final VoidCallback? onPressed;
  final double internalPadding;

  BotaoPadrao({
    Key? key,
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.internalPadding = 32,
  }) : super(key: key);

  final LinearGradient gradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      ArielColors.gradientLight,
      ArielColors.gradientDark,
    ],
  );

  final LinearGradient disabledgradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      ArielColors.disabledGradientLight,
      ArielColors.disabledGradientDark,
    ],
  );

  final ButtonStyle buttontheme = ElevatedButton.styleFrom(
    primary: ArielColors.transparent,
    onPrimary: ArielColors.baseLight,
    onSurface: ArielColors.transparent,
    shadowColor: ArielColors.transparent,
    surfaceTintColor: ArielColors.transparent,
    elevation: 0,
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
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
          gradient: widget.disabled ? widget.disabledgradient : widget.gradient,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ElevatedButton(
          style: widget.buttontheme,
          onPressed: widget.onPressed,
          child: Padding(
            padding: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: widget.internalPadding,
              right: widget.internalPadding,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
