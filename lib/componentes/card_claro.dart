import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardClaro extends StatelessWidget {
  final String titulo;
  final String descricao;
  final IconData iconeReferencia;

  static const Icon icone = Icon(
    Icons.calendar_today,
    size: 30.0,
    color: Color(0xFF1B569C),
  );

  const CardClaro({
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
            color: Color(0xFF1B569C),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          descricao,
          style: const TextStyle(
            color: Color(0xFF656565),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Color(0xFF1B569C),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        isThreeLine: true,
        tileColor: const Color(0xFFE2EDFF),
      ),
    );
  }
}
