// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class BotaoMenu extends StatefulWidget {
  final bool disabled;
  final String label;
  final Icon icon;
  final VoidCallback? onPressed;
  final double internalPadding;
  final bool selected;

  BotaoMenu({
    Key? key,
    required this.selected,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.internalPadding = 8,
  }) : super(key: key);

  final LinearGradient selectedGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      ArielColors.gradientLight,
      ArielColors.secundary,
    ],
  );

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
      fontSize: 12,
    ),
  );

  @override
  _BotaoMenuState createState() => _BotaoMenuState();
}

class _BotaoMenuState extends State<BotaoMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.selected ? null : ArielColors.secundary,
          gradient: widget.disabled ? widget.disabledgradient : widget.selected? widget.gradient : null,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: ElevatedButton(
          style: widget.buttontheme,
          onPressed: widget.onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon,
              Padding(
                padding: EdgeInsets.only(
                  top: 6,
                  left: widget.internalPadding,
                  right: widget.internalPadding,
                ),
                child: Texto(widget.label, size: 11, color: ArielColors.baseLight,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
