import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 50,
      backgroundColor: Colors.black,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('John Doe', style: headerTextStyle),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.grey[300]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
