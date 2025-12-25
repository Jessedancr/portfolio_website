import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/core/constants.dart';
import 'package:portfolio_website/widgets/touchable_opacity.dart';

class DesktopContactMeTile extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final String tileText;
  const DesktopContactMeTile({
    super.key,
    required this.icon,
    required this.onTap,
    required this.tileText,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
        child: Container(
          padding: EdgeInsets.all(12),
          width: context.screenWidth * 0.16,
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FaIcon(icon),
              Row(
                children: [
                  Text(
                    tileText,
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 16),

                  CircleAvatar(
                    radius: 20,
                    backgroundColor: context.colorScheme.onPrimaryContainer,
                    child: SvgPicture.asset(
                      'assets/up-right-arrow.svg',
                      color: context.colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
