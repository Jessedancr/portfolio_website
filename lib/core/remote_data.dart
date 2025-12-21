import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  final Uri _instaUrl = Uri.parse('https://www.instagram.com/jessedancr');
  final Uri _emailUrl = Uri.parse('mailto:jesseikemefuna@gmail.com');
  final Uri _whatsappUrl = Uri.parse('https://wa.link/gxkknx');
  final Uri _tiktokUrl = Uri.parse(
    'https://www.tiktok.com/@jessedancr?_r=1&_t=ZS-92OCFBFlHnM',
  );

  final Uri _githubUri = Uri.parse('https://github.com/jessedancr');

  Future<void> launchInsta() async {
    if (!await launchUrl(_instaUrl)) {
      throw Exception('Could not launch $_instaUrl');
    }
  }

  Future<void> launchMail() async {
    if (!await launchUrl(_emailUrl)) {
      throw Exception('Could not launch $_emailUrl');
    }
  }

  Future<void> launchWhatsapp() async {
    if (!await launchUrl(_whatsappUrl)) {
      throw Exception('Could not launch $_whatsappUrl');
    }
  }

  Future<void> launchTiktok() async {
    if (!await launchUrl(_tiktokUrl)) {
      throw Exception('Could not launch $_tiktokUrl');
    }
  }

  Future<void> launchGithub() async {
    if (!await launchUrl(_githubUri)) {
      throw Exception('Could not launch $_githubUri');
    }
  }
}
