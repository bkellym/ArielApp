// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:flutter/material.dart';

class CampoRadio extends StatefulWidget {
  final List<Map> valores;
  final void Function(dynamic)? onChange;
  String? selecionado;

  CampoRadio({
    Key? key,
    required this.valores,
    this.onChange,
  }) : super(key: key) {
    selecionado = valores.first['id'];
  }
  @override
  _CampoRadioState createState() => _CampoRadioState();
}

class _CampoRadioState extends State<CampoRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (Map valor in widget.valores)
          ListTile(
            title: Text(
              "${valor['titulo']}",
              style: const TextStyle(
                color: ArielColors.textPrimary,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                decoration: TextDecoration.none,
              ),
            ),
            leading: Radio<dynamic>(
              activeColor: ArielColors.secundary,
              value: valor['id'],
              groupValue: widget.selecionado,
              onChanged: (value) {
                setState(() {
                  widget.selecionado = value;
                });
                widget.onChange!(value);
              },
            ),
          ),
      ],
    );
  }
}
