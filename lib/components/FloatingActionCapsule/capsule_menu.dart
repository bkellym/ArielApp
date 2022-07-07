import 'package:ariel_app/components/FloatingActionCapsule/capsule.dart';
import 'package:flutter/material.dart';

class CapsuleMenu extends StatelessWidget {
  const CapsuleMenu(this.item, {Key? key}) : super(key: key);

  final Capsule item;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(),
      padding: const EdgeInsets.only(top: 11, bottom: 13, left: 16, right: 32),
      color: item.bubbleColor,
      splashColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.1),
      elevation: 2,
      highlightElevation: 2,
      disabledColor: item.bubbleColor,
      onPressed: item.onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            item.icon,
            color: item.iconColor,
            size: 10,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            item.title,
            style: item.titleStyle,
          ),
        ],
      ),
    );
  }
}