import 'package:flutter/material.dart';

class CicloPage extends StatefulWidget {
  const CicloPage({Key? key}) : super(key: key);

  @override
  State<CicloPage> createState() => _CicloPageState();
}

class _CicloPageState extends State<CicloPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text("Ciclos")
    );
  }
}
