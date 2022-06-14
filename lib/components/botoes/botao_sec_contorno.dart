// ignore_for_file: library_private_types_in_public_api

import 'dart:collection';

import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

class BtSecContorno extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final double fontSize;
  final double internalPadding;
  final Color color;

  const BtSecContorno({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.color,
    this.internalPadding = 32,
    this.fontSize = 10,
  }) : super(key: key);

  @override
  _BtSecContornoState createState() => _BtSecContornoState();
}

class _BtSecContornoState extends State<BtSecContorno> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: widget.color,
            side: BorderSide(
              color: widget.color,
              width: 1.5,
            )),
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
