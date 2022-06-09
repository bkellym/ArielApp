import 'package:flutter/material.dart';
import 'base_auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAuth(
      login: true,
      titleBold: "ENTRE ",
      titleRegular: "NA SUA CONTA",
      child: Column(),
    );
  }
}
