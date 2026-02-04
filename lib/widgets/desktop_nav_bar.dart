import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants.dart';

class DesktopNavBar extends StatelessWidget {
  final Function(String) onMenuItemSelected;

  const DesktopNavBar({super.key, required this.onMenuItemSelected});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 70,
      backgroundColor: context.colorScheme.surface,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ikemefuna 'Trace' Jesse",
                style: headerTextStyle.copyWith(fontSize: 30),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => onMenuItemSelected('About me'),
                      child: Text(
                        'About me',
                        style: subtitleTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 8),

                    TextButton(
                      onPressed: () => onMenuItemSelected('Collaborations'),
                      child: Text(
                        'Collaborations',
                        style: subtitleTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 8),

                    TextButton(
                      onPressed: () => onMenuItemSelected('Recent works'),
                      child: Text(
                        'Recent Works',
                        style: subtitleTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 8),

                    TextButton(
                      onPressed: () => onMenuItemSelected('Contact me'),
                      child: Text(
                        'Contact me',
                        style: subtitleTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
