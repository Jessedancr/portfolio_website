import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  fontFamily: 'PTSerif',
);

final TextStyle subtitleTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Colors.white,
  fontFamily: 'PTSerif',
);

final FilterQuality mediumImageQuality = FilterQuality.medium;

final List<String> danceStyles = ["Hiphop", "Afro", "Popping", "Krump"];

List<String> brands = [
  'assets/brands/ffwnm.jpeg',
  'assets/brands/tmg.jpeg',
  'assets/brands/nike.png',
  'assets/brands/pepsi.jpg',
];

final List<Map<String, dynamic>> recentWorks = [
  {
    'imagePath': 'assets/dance_img2.jpg',
    'jobTitle': 'Job Title',
    'jobDescr': 'Short Description',
    'leadingIcon': FontAwesomeIcons.bolt,
  },
  {
    'imagePath': 'assets/dance_img3.jpg',
    'jobTitle': 'Job Title',
    'jobDescr': 'Short Description',
    'leadingIcon': FontAwesomeIcons.solidWebAwesome,
  },
  {
    'imagePath': 'assets/dance_img4.jpg',
    'jobTitle': 'Job Title',
    'jobDescr': 'Short Description',
    'leadingIcon': FontAwesomeIcons.spinner,
  },
];
