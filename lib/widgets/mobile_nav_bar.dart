import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants.dart';

class MobileNavBar extends StatelessWidget {
  final Function(String) onMenuItemSelected;

  const MobileNavBar({super.key, required this.onMenuItemSelected});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 50,
      backgroundColor: context.colorScheme.surface,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('John Doe', style: headerTextStyle),

              // * Pop up menu
              PopupMenuButton(
                borderRadius: BorderRadius.circular(20),
                popUpAnimationStyle: AnimationStyle(
                  duration: Duration(milliseconds: 400),
                ),
                color: context.colorScheme.secondaryContainer,
                onSelected: onMenuItemSelected,
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(20),
                ),
                shadowColor: context.colorScheme.tertiary,
                tooltip: 'Navigation menu',
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'About me',
                    labelTextStyle: WidgetStatePropertyAll(subtitleTextStyle),
                    child: Text('About me'),
                  ),
                  PopupMenuItem(
                    value: "Collaborations",
                    labelTextStyle: WidgetStatePropertyAll(subtitleTextStyle),
                    child: Text("Collaborations"),
                  ),
                  PopupMenuItem(
                    value: 'My recent works',
                    labelTextStyle: WidgetStatePropertyAll(subtitleTextStyle),
                    child: Text("My recent works"),
                  ),
                  PopupMenuItem(
                    value: 'Contact me',
                    labelTextStyle: WidgetStatePropertyAll(subtitleTextStyle),
                    child: Text('Contact me'),
                  ),
                ],
                icon: Icon(
                  Icons.more_horiz,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
