import 'package:flutter/material.dart';

import '../core/util/colors.dart';

class Divisoria extends StatelessWidget {
  final Color cor;

  const Divisoria({
    Key? key,
    required this.cor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: cor,
      height: 10,
      thickness: 1.5,
    );
  }
}
