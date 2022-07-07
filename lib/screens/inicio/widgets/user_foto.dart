import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class UserFoto extends StatelessWidget {
  final String? foto;
  final String inicialNome;

  const UserFoto({
    Key? key,
    this.foto,
    required this.inicialNome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (foto != null && foto != "") {
      return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ArielColors.baseLight,
                  width: 3.0,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.network(
                    foto!,
                  ).image,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        child: Container(
          width: 48.0,
          height: 48.0,
          decoration: BoxDecoration(
            color: ArielColors.arielGreen,
            border: Border.all(
                width: 3.0,
                color: ArielColors.baseLight),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Texto(
              inicialNome,
              color: ArielColors.baseLight,
              size: 20,
            ),
          ),
        ),
      );
    }
  }
}
