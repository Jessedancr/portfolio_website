import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/core/constants.dart';
import 'package:portfolio_website/core/remote_data.dart';
import 'package:portfolio_website/widgets/desktop_contact_me_tile.dart';
import 'package:portfolio_website/widgets/desktop_footer.dart';
import 'package:portfolio_website/widgets/desktop_header.dart';
import 'package:portfolio_website/widgets/desktop_nav_bar.dart';
import 'package:portfolio_website/widgets/project_container.dart';
import 'package:portfolio_website/widgets/user_circle_avatar.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  late ScrollController _scrollController;
  late Timer _timer;

  final GlobalKey aboutMeKey = GlobalKey();
  final GlobalKey brandsKey = GlobalKey();
  final GlobalKey worksKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_scrollController.hasClients) {
        // * Finds the maximum scroll position (The bottom of the list)
        double maxScroll = _scrollController.position.maxScrollExtent;

        // * Current scroll position
        double current = _scrollController.offset;

        // * If we are at the end of the list, scroll back to the start
        if (current >= maxScroll) {
          _scrollController.animateTo(
            0.0,
            duration: Duration(seconds: 4),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            current + 200.0,
            duration: Duration(seconds: 3),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(String section) {
    GlobalKey key;
    switch (section) {
      case "About me":
        key = aboutMeKey;
        break;
      case "Collaborations":
        key = brandsKey;
        break;
      case "Recent works":
        key = worksKey;
        break;
      case "Contact me":
        key = contactKey;
        break;
      default:
        return;
    }
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          DesktopNavBar(onMenuItemSelected: scrollToSection),
          DesktopHeader(),

          // * About me
          SliverToBoxAdapter(
            key: aboutMeKey,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 10,
                right: 10,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserCircleAvatar(radius: 100),
                  const SizedBox(width: 20),

                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'About me',
                          style: headerTextStyle.copyWith(fontSize: 40),
                        ),
                        Text(
                          AppTexts.aboutMe,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                          style: subtitleTextStyle.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // * Brands worked with
          SliverToBoxAdapter(
            key: brandsKey,
            child: Column(
              children: [
                Text(
                  "Proudly worked with",
                  style: headerTextStyle.copyWith(fontSize: 40),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.2,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    height: 50.0,
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: brands.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: context.screenWidth * 0.1,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(20),
                            child: Image.asset(
                              brands[index],
                              filterQuality: mediumImageQuality,
                              width: 50,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // * Some recent works
          SliverToBoxAdapter(
            key: worksKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Work",
                    style: headerTextStyle.copyWith(fontSize: 40),
                  ),
                  Text(
                    'Check out some of my recent works',
                    style: subtitleTextStyle.copyWith(fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid.builder(
            itemCount: recentWorks.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              return ProjectContainer(
                imagePath: recentWorks[index]['imagePath'],
                jobTitle: recentWorks[index]['jobTitle'],
                jobDescr: recentWorks[index]['jobDescr'],
                leadingIcon: recentWorks[index]['leadingIcon'],
              );
            },
          ),

          //  * Contact me
          SliverToBoxAdapter(
            key: contactKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Contact me',
                  style: headerTextStyle.copyWith(fontSize: 40),
                ),
                Text(
                  "Whether it's for a collaboration, booking, or just to say hello,I'd love to hear from you!",
                  textAlign: TextAlign.center,
                  style: subtitleTextStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DesktopContactMeTile(
                      icon: FontAwesomeIcons.instagram,
                      onTap: UrlLauncher().launchInsta,
                      tileText: 'Instagram',
                    ),
                    DesktopContactMeTile(
                      icon: FontAwesomeIcons.tiktok,
                      onTap: UrlLauncher().launchTiktok,
                      tileText: 'Tiktok',
                    ),
                    DesktopContactMeTile(
                      icon: FontAwesomeIcons.whatsapp,
                      onTap: UrlLauncher().launchWhatsapp,
                      tileText: 'Whatsapp',
                    ),
                    DesktopContactMeTile(
                      icon: FontAwesomeIcons.envelope,
                      onTap: UrlLauncher().launchMail,
                      tileText: 'Email',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // * Footer
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: DesktopFooter(),
          ),
        ],
      ),
    );
  }
}
