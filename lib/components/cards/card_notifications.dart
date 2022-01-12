import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      child: Container(
        margin: const EdgeInsets.only(top: 16, left: 16),
        decoration: const BoxDecoration(
          color: Color(0xFFE2EDFF),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.notifications_none_rounded,
            color: Color(0xFF1B569C),
            size: 32,
          ),
        ),
      ),
    );
  }
}
