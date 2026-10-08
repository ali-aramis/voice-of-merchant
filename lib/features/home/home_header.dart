import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../core/utils/responsive.dart';
import 'language_button.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.borderLight)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 20 : 40,
        vertical: 14,
      ),
      child: ContentWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Image.asset(
                  'assets/images/bahrain-chamber.png',
                  width: context.isMobile ? 145 : 185,
                  fit: BoxFit.contain,
                  semanticLabel: 'Bahrain Chamber',
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            const LanguageButton(),
          ],
        ),
      ),
    );
  }
}