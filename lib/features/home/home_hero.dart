import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../core/utils/responsive.dart';


class HomeHero extends StatelessWidget {
  const HomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.responsive(mobile: 230.0, tablet: 275.0, desktop: 305.0),
      child: Image.asset(
        'assets/images/banner.png',
        fit: BoxFit.cover,
        excludeFromSemantics: true,
        errorBuilder: (_, __, ___) =>
        const ColoredBox(color: AppColors.heroFallback),
      ),
    );
  }
}