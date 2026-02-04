import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants.dart';
import 'package:portfolio_website/widgets/glass_box.dart';

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.screenHeight * 0.85,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // * Image Background
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'header_img'.jpeg,
                fit: BoxFit.cover,
                filterQuality: highImageQuality,
              ),
            ),

            // * Glass Box Overlay
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: GlassBox(opacity1: 0.5, opacity2: 0.5),
            ),

            // * Subtitle
            Align(
              alignment: Alignment.topRight,
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Professional\nDance\nArtiste\n',
                      style: TextStyle(
                        color: context.colorScheme.surface,
                        fontWeight: FontWeight.w900,
                        fontSize: 70,
                        fontFamily: 'PTSerif',
                      ),
                    ),

                    TextSpan(
                      text: 'Energy. Expression. Every Movement Tells a Story.',
                      style: TextStyle(
                        color: context.colorScheme.surface,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'PTSerif',
                      ),
                    ),
                  ],
                ),
              ),
              // child: Text(
              //   'Professional\nDance\nArtiste',
              //   textAlign: TextAlign.end,
              // style: TextStyle(
              //   color: context.colorScheme.surface,
              //   fontWeight: FontWeight.w900,
              //   fontSize: 70,
              //   fontFamily: 'PTSerif',
              // ),
              // ),
            ),

            // * Dance styles
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: danceStyles.length,
                  itemBuilder: (context, index) {
                    // Get all indexes
                    var indexes = danceStyles.asMap().keys;
                    var danceIndex = indexes.toList();
                    danceIndex = danceIndex.map((e) => e + 1).toList();

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.screenWidth * 0.05,
                      ),
                      child: GlassBox(
                        height: 20,
                        width: context.screenWidth * 0.15,
                        borderRadius: BorderRadius.circular(15),
                        opacity1: 0.5,
                        opacity2: 0.5,
                        sigmaX: 3,
                        sigmaY: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '0${danceIndex[index].toString()}',
                                style: TextStyle(
                                  color: context.colorScheme.surface,
                                  fontSize: 18,
                                  // fontWeight: FontWeight.w400,
                                  fontFamily: 'PTSerif',
                                ),
                              ),
                              Text(
                                danceStyles[index],
                                style: TextStyle(
                                  color: context.colorScheme.surface,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PTSerif',
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
