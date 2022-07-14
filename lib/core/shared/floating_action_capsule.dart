import 'dart:ui';

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
      child: Padding(
        padding: const EdgeInsets.only(right: 9),
        child: Transform(
          transform: transform,
          child: Opacity(
            opacity: _animation.value,
            child: CapsuleMenu(items[index]),
          ),
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
          child: TweenAnimationBuilder<double>(
              tween: Tween(begin: _animation.value, end: _animation.value),
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn,
              builder: (_, value, __) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: value * 2, sigmaY: value * 2),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: items.length,
                    itemBuilder: buildItem,
                  ),
                );
              }),
        ),
        FloatingActionButton(
          heroTag: herotag ?? const _DefaultHeroTag(),
          backgroundColor: backGroundColor,
          onPressed: onPress,
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
    return InkWell(
      onTap: item.onPress, // Handle your callback
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Material(
              elevation: 2,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  color: item.bubbleColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: Text(item.title, style: item.titleStyle),
              ),
            ),
          ),
          Material(
            elevation: 2,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: item.bubbleColor,
                shape: BoxShape.circle,
              ),
              child: Icon(item.icon, color: item.iconColor, size: 20),
            ),
          )
        ],
      ),
    );
  }
}
