// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ariel_app/telas/TelaInicial.dart';

//Chamada da main para o aplicativo
void main() => runApp(const ArielApp());

// Código base do Aplicativo
class ArielApp extends StatelessWidget {
  const ArielApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TelaInicial(),
    );
  }
}
