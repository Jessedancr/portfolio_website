import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/core/constants.dart';
import 'package:portfolio_website/widgets/touchable_opacity.dart';

class ContactMeTile extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const ContactMeTile({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: context.colorScheme.primaryContainer,
          child: FaIcon(icon),
        ),
      ),
    );
  }
}
