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
final FilterQuality highImageQuality = FilterQuality.high;

final List<String> danceStyles = [
  "Hiphop",
  "Afro Fusion",
  "Animation",
  "Contemporary",
];

List<String> brands = [
  'ffwnm'.jpeg,
  'tmg'.jpeg,
  'rage_fam'.jpeg,
  'vybe_nation'.jpeg,
];

final List<Map<String, dynamic>> recentWorks = [
  {
    'imagePath': 'fun'.jpeg,
    'jobTitle': 'Job Title',
    'jobDescr': 'Short Description',
    'leadingIcon': FontAwesomeIcons.bolt,
  },
  {
    'imagePath': 'it_depends'.jpeg,
    'jobTitle': 'Job Title',
    'jobDescr': 'Short Description',
    'leadingIcon': FontAwesomeIcons.solidWebAwesome,
  },
  {
    'imagePath': 'luvah'.jpeg,
    'jobTitle': 'Job Title',
    'jobDescr': 'Short Description',
    'leadingIcon': FontAwesomeIcons.spinner,
  },
];

extension AssetName on String {
  String get svg => 'assets/$this.svg';
  String get png => 'assets/$this.png';
  String get jpeg => 'assets/$this.jpeg';
  String get jpg => 'assets/$this.jpg';
  String get mp4 => 'assets/$this.mp4';
}

class AppTexts {
  static const String aboutMe =
      "Professional dance artiste performing under the brand TRACE, a movement identity rooted in authenticity and self-expression. Experienced in stage performances, dance video productions, and brand collaborations, with a strong foundation in freestyle, hip-hop, and performance-driven choreography.";
}
