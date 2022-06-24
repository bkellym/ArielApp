import 'package:flutter/material.dart';

import '../core/util/colors.dart';

class DivisoriaDecorada extends StatelessWidget {
  final Color cor;

  const DivisoriaDecorada({
    Key? key,
    required this.cor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
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
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
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
