import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/core/constants.dart';
import 'package:portfolio_website/core/remote_data.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

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
              width: context.screenWidth * 0.8,
              color: Colors.grey[800],
              margin: EdgeInsets.only(bottom: 20),
            ),

            // * DEVELOPER CREDIT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Designed & Developed by Jessedancr',
                  style: subtitleTextStyle,
                ),

                // * SOCIAL LINKS
                Row(
                  children: [
                    // * IG
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      onPressed: UrlLauncher().launchInsta,
                    ),
                    const SizedBox(width: 10),

                    // * Github
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.github),
                      onPressed: UrlLauncher().launchGithub,
                    ),
                    const SizedBox(width: 10),

                    // * Whatsapp
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.whatsapp),
                      onPressed: UrlLauncher().launchWhatsapp,
                    ),
                    const SizedBox(width: 10),

                    // * Mail
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.envelope),
                      onPressed: UrlLauncher().launchMail,
                    ),
                  ],
                ),

                // * CONTACT
                Column(
                  children: [
                    Text(
                      'jesseikemefuna@gmail.com',
                      style: subtitleTextStyle.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 5),

                    // * COPYRIGHT
                    Text(
                      '© 2025 Ikemefuna Jesse',
                      style: subtitleTextStyle.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
