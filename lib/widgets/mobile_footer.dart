import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/core/constants.dart';
import 'package:portfolio_website/core/remote_data.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        color: Colors.black,
        child: Column(
          children: [
            // * DIVIDER LINE
            Container(
              height: 1,
              width: 100,
              color: Colors.grey[800],
              margin: EdgeInsets.only(bottom: 20),
            ),

            // * DEVELOPER CREDIT
            Text(
              'Designed & Developed by Jessedancr',
              style: subtitleTextStyle,
            ),
            SizedBox(height: 15),

            // * SOCIAL LINKS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // * IG
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.instagram),
                  onPressed: UrlLauncher().launchInsta,
                ),

                // * Github
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.github),
                  onPressed: UrlLauncher().launchGithub,
                ),

                // * Whatsapp
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.whatsapp),
                  onPressed: UrlLauncher().launchWhatsapp,
                ),

                // * Mail
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.envelope),
                  onPressed: UrlLauncher().launchMail,
                ),
              ],
            ),

            // * CONTACT
            Text(
              'jesseikemefuna@gmail.com',
              style: subtitleTextStyle.copyWith(color: Colors.grey[600]),
            ),
            SizedBox(height: 5),

            // * COPYRIGHT
            Text(
              '© 2025 Ikemefuna Jesse',
              style: subtitleTextStyle.copyWith(
                color: Colors.grey[600],
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
