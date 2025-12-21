import 'package:flutter/material.dart';

extension ScreenDimension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension MyColorScheme on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

final TextStyle headerTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final TextStyle subtitleTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

final FilterQuality mediumImageQuality = FilterQuality.medium;
