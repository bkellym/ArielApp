import 'package:flutter/material.dart';

class Divisoria extends StatelessWidget {
  const Divisoria({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.transparent,
      height: 24,
    );
  }
}
