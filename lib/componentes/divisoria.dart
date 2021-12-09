import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Divisoria extends StatelessWidget {
  const Divisoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20,
      thickness: 5,
      indent: 20,
      endIndent: 20,
    );
  }
}
