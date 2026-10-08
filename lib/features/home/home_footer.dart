import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import '../../app/app_colors.dart';
import '../../core/utils/responsive.dart';


class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  static const _infoStyle = TextStyle(color: Colors.white, fontSize: 13);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: AppColors.footer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ContentWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/footer_logo.png',
                    width: 120,
                    fit: BoxFit.contain,
                    semanticLabel: 'Bahrain Chamber',
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(l10n.kingdomOfBahrain, style: _infoStyle),
                      const SizedBox(height: 3),
                      const Text('bcc.bh', style: _infoStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.white.withValues(alpha: 0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(
              l10n.copyright,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.footerMuted,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}