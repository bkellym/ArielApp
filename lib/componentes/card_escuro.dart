import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardEscuro extends StatelessWidget {
  final String titulo;
  final String descricao;
  final IconData iconeReferencia;

  static const Icon icone = Icon(
    Icons.calendar_today,
    size: 30.0,
    color: Colors.white,
  );

  const CardEscuro({
    Key? key,
    required this.titulo,
    required this.descricao,
    required this.iconeReferencia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      elevation: 8,
      child: ListTile(
        leading: icone,
        title: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          descricao,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        isThreeLine: true,
        tileColor: const Color(0xFF1B569C),
      ),
    );
  }
}
