// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/models/botaoMenuModel.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class BotaoMenu extends StatefulWidget {
  final bool disabled;
  final BotaoMenuModel model;
  final Function? onPressed;
  final double internalPadding;
  final bool selected;

  BotaoMenu({
    Key? key,
    required this.selected,
    required this.onPressed,
    this.disabled = false,
    this.internalPadding = 8,
    required this.model,
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
    enableFeedback: false,
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
      padding: const EdgeInsets.all(0),
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.selected ? null : Colors.white,
          gradient: widget.disabled
              ? widget.disabledgradient
              : widget.selected
                  ? widget.gradient
                  : null,
        ),
        child: ElevatedButton(
          style: widget.buttontheme,
          onPressed: () {
            widget.onPressed!(widget.model.index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.model.icon,
                color: widget.selected
                    ? ArielColors.baseLight
                    : ArielColors.gradientLight,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.of(context).dynamicScaleSize(size: 6),
                  left: widget.internalPadding,
                  right: widget.internalPadding,
                ),
                child: Texto(
                  widget.model.titulo,
                  fontWeight: Weight.bold,
                  size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                  color: widget.selected
                      ? ArielColors.baseLight
                      : ArielColors.gradientLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
