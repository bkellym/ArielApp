import 'package:flutter/widgets.dart';

class SizeConfig {
  final MediaQueryData mediaQueryData;

  SizeConfig({required this.mediaQueryData});

  static SizeConfig of(BuildContext context) =>
      SizeConfig(mediaQueryData: MediaQuery.of(context));

  double dynamicScaleSize(
      {required double size,
      double scaleFactorTablet = 2,
      double scaleFactorMini = 0.8}) {
    if (_isTablet()) {
      final scaleFactor = scaleFactorTablet;
      return size * scaleFactor;
    }

    if (_isMini()) {
      final scaleFactor = scaleFactorMini;
      return size * scaleFactor;
    }

    return size;
  }

  /// Defines device type based on logical device pixels. Bigger than 600 means it is a tablet
  bool _isTablet() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide > 600;
  }

  /// Defines device type based on logical device pixels. Less or equal than 320 means it is a mini device
  bool _isMini() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide <= 320;
  }
}
