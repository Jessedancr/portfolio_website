import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/core/constants.dart';
import 'package:portfolio_website/widgets/touchable_opacity.dart';

class ProjectContainer extends StatelessWidget {
  final String imagePath;
  final String jobTitle;
  final String jobDescr;
  final IconData leadingIcon;
  const ProjectContainer({
    super.key,
    required this.imagePath,
    required this.jobTitle,
    required this.jobDescr,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // * Image
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Hero(
            tag: 'image',
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 500,
              width: double.infinity,
              filterQuality: mediumImageQuality,
            ),
          ),
        ),

        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(
                      leadingIcon,
                      color: context.colorScheme.onSurface,
                      size: 15,
                    ),
                    SizedBox(width: 16),

                    // * Job Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobTitle,
                          style: subtitleTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          jobDescr,
                          style: subtitleTextStyle.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                TouchableOpacity(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Hero(
                            tag: 'image',
                            child: Stack(
                              children: [
                                Image.asset(imagePath),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.close, size: 30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: FaIcon(
                    FontAwesomeIcons.expand,
                    size: 15,
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
