import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants.dart';
import 'package:portfolio_website/widgets/glass_box.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: context.screenHeight * 0.8,
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
                'assets/dance_img1.jpg',
                fit: BoxFit.cover,
                filterQuality: mediumImageQuality,
              ),
            ),

            // * Glass Box Overlay
            Positioned(top: 0, bottom: 0, left: 0, right: 0, child: GlassBox()),

            // * Subtitle
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Professional Dance Artiste',
                style: headerTextStyle.copyWith(color: Colors.black),
              ),
            ),

            // * Dance styles grid
            Positioned(
              top: 150,
              left: 30,
              right: 30,
              height: 400,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.3,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  // Get all indexes
                  var indexes = danceStyles.asMap().keys;
                  var danceIndex = indexes.toList();
                  danceIndex = danceIndex.map((e) => e + 1).toList();

                  return GlassBox(
                    height: 20,
                    width: 20,
                    borderRadius: BorderRadius.circular(15),
                    opacity1: 0,
                    opacity2: 1,
                    sigmaX: 2,
                    sigmaY: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '0${danceIndex[index].toString()}',
                            style: subtitleTextStyle.copyWith(
                              color: context.colorScheme.surface,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            danceStyles[index],
                            style: subtitleTextStyle.copyWith(
                              fontSize: 14,
                              color: context.colorScheme.surface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        title: Text(
          'Energy. Expression. Every Movement Tells a Story.',
          textAlign: TextAlign.center,
          style: subtitleTextStyle.copyWith(
            fontSize: 14,
            color: context.colorScheme.surface,
            fontWeight: FontWeight.bold,
          ),
        ),
        collapseMode: CollapseMode.parallax,
        titlePadding: EdgeInsets.all(8),
      ),
    );
  }
}
