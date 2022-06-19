// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

class BotaoTextoIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const BotaoTextoIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  _BotaoTextoIconState createState() => _BotaoTextoIconState();
}

class _BotaoTextoIconState extends State<BotaoTextoIcon> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      // <-- TextButton
      onPressed: widget.onPressed,
      icon: Icon(
        widget.icon,
        size: 16.0,
      ),
      label: Text(
        widget.label,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          color: ArielColors.textPrimary,
          fontSize: 10,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
