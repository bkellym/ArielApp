import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  late bool isDark;
  NotificationButton({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      child: Container(
        margin: const EdgeInsets.only(top: 16, left: 16),
        decoration: BoxDecoration(
          color: ArielColors.baseLight,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            Icons.notifications_none_rounded,
            color: ArielColors.baseDark,
            size: 32,
          ),
        ),
      ),
    );
  }
}
