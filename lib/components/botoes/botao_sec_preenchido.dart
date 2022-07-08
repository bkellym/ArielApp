// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BtSecPreenchido extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final double fontSize;
  final double internalPadding;
  final Color color;

  const BtSecPreenchido({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.color,
    this.internalPadding = 32,
    this.fontSize = 10,
  }) : super(key: key);

  @override
  _BtSecPreenchidoState createState() => _BtSecPreenchidoState();
}

class _BtSecPreenchidoState extends State<BtSecPreenchido> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: widget.color),
        onPressed: widget.onPressed,
        child: Padding(
          padding: EdgeInsets.only(
            top: 6,
            bottom: 6,
            left: widget.internalPadding,
            right: widget.internalPadding,
          ),
          child: Text(
            widget.label,
            style: TextStyle(fontSize: widget.fontSize),
          ),
        ),
      ),
    );
  }
}
