import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

class BotaoGoogle extends StatelessWidget {
  const BotaoGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(120, 40),
        primary: ArielColors.googleRed,
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
        "Google",
        style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
      ),
    );
  }
}
