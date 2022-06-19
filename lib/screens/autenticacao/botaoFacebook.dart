import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

class BotaoFacebook extends StatelessWidget {
  const BotaoFacebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(120, 40),
        primary: ArielColors.facebookBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.logo_dev,
        color: Colors.white,
        size: 20.0,
      ),
      label: const Text(
        "Facebook",
        style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
      ),
    );
  }
}
