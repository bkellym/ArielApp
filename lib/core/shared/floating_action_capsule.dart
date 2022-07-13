import 'package:flutter/material.dart';

class Capsule {
  const Capsule({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.titleStyle,
    required this.bubbleColor,
    required this.onPress,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final TextStyle titleStyle;
  final Color bubbleColor;
  final void Function() onPress;
}

class FloatingActionCapsule extends AnimatedWidget {
  const FloatingActionCapsule({
    Key? key,
    required this.items,
    required this.onPress,
    required this.iconColor,
    required this.backGroundColor,
    required Animation animation,
    this.herotag,
    this.iconData,
    this.animatedIconData,
  })  : assert((iconData == null && animatedIconData != null) ||
            (iconData != null && animatedIconData == null)),
        super(listenable: animation, key: key);

  final List<Capsule> items;
  final void Function() onPress;
  final AnimatedIconData? animatedIconData;
  final Object? herotag;
  final IconData? iconData;
  final Color iconColor;
  final Color backGroundColor;

  get _animation => listenable;

  Widget buildItem(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;

    TextDirection textDirection = Directionality.of(context);

    double animationDirection = textDirection == TextDirection.ltr ? -1 : 1;

    final transform = Matrix4.translationValues(
      animationDirection *
          (screenWidth - _animation.value * screenWidth) *
          ((items.length - index) / 4),
      0.0,
      0.0,
    );

    return Align(
      alignment: textDirection == TextDirection.ltr
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Transform(
        transform: transform,
        child: Opacity(
          opacity: _animation.value,
          child: CapsuleMenu(items[index]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IgnorePointer(
          ignoring: _animation.value == 0,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: items.length,
            itemBuilder: buildItem,
          ),
        ),
        FloatingActionButton(
          heroTag: herotag ?? const _DefaultHeroTag(),
          backgroundColor: backGroundColor,
          onPressed: onPress,
          // iconData is mutually exclusive with animatedIconData
          // only 1 can be null at the time
          child: iconData == null
              ? AnimatedIcon(
                  icon: animatedIconData!,
                  progress: _animation,
                  color: iconColor)
              : Icon(iconData, color: iconColor),
        ),
      ],
    );
  }
}

class _DefaultHeroTag {
  const _DefaultHeroTag();

  @override
  String toString() => '<default FloatingActionBubble tag>';
}

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
          Icon(item.icon, color: item.iconColor, size: 10),
          const SizedBox(width: 8.0),
          Text(item.title, style: item.titleStyle),
        ],
      ),
    );
  }
}
