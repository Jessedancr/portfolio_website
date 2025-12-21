import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/core/constants.dart';
import 'package:portfolio_website/core/remote_data.dart';
import 'package:portfolio_website/widgets/contact_me_tile.dart';
import 'package:portfolio_website/widgets/mobile_footer.dart';
import 'package:portfolio_website/widgets/mobile_header.dart';
import 'package:portfolio_website/widgets/mobile_nav_bar.dart';
import 'package:portfolio_website/widgets/project_container.dart';
import 'package:portfolio_website/widgets/user_circle_avatar.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  late ScrollController _scrollController;
  late Timer _timer;

  final GlobalKey aboutMeKey = GlobalKey();
  final GlobalKey brandsKey = GlobalKey();
  final GlobalKey worksKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();


  List<String> brands = [
    'assets/brands/ffwnm.jpeg',
    'assets/brands/tmg.jpeg',
    'assets/brands/nike.jpg',
  ];

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
      case "Brands I've worked with":
        key = brandsKey;
        break;
      case "My recent works":
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
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            MobileNavBar(onMenuItemSelected: scrollToSection),
            MobileHeader(),

            // * About me
            SliverToBoxAdapter(
              key: aboutMeKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserCircleAvatar(),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'About me',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae, "
                            "nihil ducimus. Minima esse eligendi cum repudiandae tenetur beatae "
                            "adipisci, vitae amet, facilis, alias ab pariatur numquam nemo "
                            "explicabo tempora culpa",
                            softWrap: true,
                            textAlign: TextAlign.justify,
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
                  const SizedBox(height: 20),

                  Text("Proudly worked with", style: headerTextStyle),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 80.0,
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: brands.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(20),
                              child: Image.asset(
                                brands[index],
                                filterQuality: mediumImageQuality,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Work", style: headerTextStyle),
                    Text(
                      'Check out some of my recent works',
                      style: subtitleTextStyle,
                    ),
                    const SizedBox(height: 20),
                    ProjectContainer(
                      imagePath: 'assets/dance_img2.jpg',
                      jobTitle: 'Job Title',
                      jobDescr: 'Short Description',
                      leadingIcon: FontAwesomeIcons.bolt,
                    ),
                    const SizedBox(height: 20),

                    ProjectContainer(
                      imagePath: 'assets/dance_img3.jpg',
                      jobTitle: 'Job Title',
                      jobDescr: 'Short Description',
                      leadingIcon: FontAwesomeIcons.solidWebAwesome,
                    ),
                    const SizedBox(height: 20),

                    ProjectContainer(
                      imagePath: 'assets/dance_img4.jpg',
                      jobTitle: 'Job Title',
                      jobDescr: 'Short Description',
                      leadingIcon: FontAwesomeIcons.spinner,
                    ),
                  ],
                ),
              ),
            ),

            //  * Contact me
            SliverToBoxAdapter(
              key: contactKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Contact me', style: headerTextStyle),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContactMeTile(
                        icon: FontAwesomeIcons.instagram,
                        onTap: UrlLauncher().launchInsta,
                      ),
                      ContactMeTile(
                        icon: FontAwesomeIcons.tiktok,
                        onTap: UrlLauncher().launchTiktok,
                      ),
                      ContactMeTile(
                        icon: FontAwesomeIcons.whatsapp,
                        onTap: UrlLauncher().launchWhatsapp,
                      ),
                      ContactMeTile(
                        icon: FontAwesomeIcons.envelope,
                        onTap: UrlLauncher().launchMail,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: MobileFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
