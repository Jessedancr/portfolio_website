import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants.dart';

class UserCircleAvatar extends StatelessWidget {
  final double? radius;

  const UserCircleAvatar({super.key, this.radius = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.colorScheme.primary, width: 3),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: context.colorScheme.primaryContainer,
        backgroundImage: AssetImage('assets/dance_img5.jpg'),
      ),
    );
  }
}
