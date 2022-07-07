import 'package:flutter/material.dart';

class DivisoriaDecorada extends StatelessWidget {
  final Color cor;
  final EdgeInsetsGeometry? padding;

  const DivisoriaDecorada({
    Key? key,
    required this.cor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Divider(
            color: cor,
            height: 10,
            thickness: 1.5,
          ),
          Container(
            width: 10.0,
            height: 10.0,
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: cor,
            ),
          ),
        ],
      ),
    );
  }
}
