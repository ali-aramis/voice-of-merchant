import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import '../../core/utils/responsive.dart';
import 'feature_card.dart';


class HomeFeatures extends StatelessWidget {
  const HomeFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final features = [
      FeatureData(
        icon: Icons.grid_view_rounded,
        title: l10n.featureEntitiesTitle,
        description: l10n.featureEntitiesDesc,
      ),
      FeatureData(
        icon: Icons.shield_outlined,
        title: l10n.featureSupportTitle,
        description: l10n.featureSupportDesc,
      ),
      FeatureData(
        icon: Icons.access_time,
        title: l10n.featureTrackingTitle,
        description: l10n.featureTrackingDesc,
      ),
      FeatureData(
        icon: Icons.check_circle_outline,
        title: l10n.featureSolutionsTitle,
        description: l10n.featureSolutionsDesc,
      ),
    ];

    final int columns = context.responsive(mobile: 1, tablet: 2, desktop: 4);
    final double spacing = context.isMobile ? 16 : 24;
    final double horizontalPadding =
    context.responsive(mobile: 20.0, tablet: 35.0, desktop: 40.0);

    // Rows of equal-height cards that grow with content and font size.
    final rows = [
      for (int i = 0; i < features.length; i += columns)
        features.sublist(i, (i + columns).clamp(0, features.length)),
    ];

    return ContentWidth(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            for (int r = 0; r < rows.length; r++) ...[
              if (r > 0) SizedBox(height: spacing),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int c = 0; c < columns; c++) ...[
                      if (c > 0) SizedBox(width: spacing),
                      Expanded(
                        child: c < rows[r].length
                            ? FeatureCard(data: rows[r][c])
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}