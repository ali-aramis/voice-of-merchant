import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/localization/app_localizations.dart';
import 'complaint_form_controller.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
  });

  static const double circleSize = 44;

  static const Color primary = Color(0xFF1A2A5E);
  static const Color border = Color(0xFFDCE3EF);
  static const Color text = Color(0xFF65738C);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ComplaintFormController>();
    context.watch<ComplaintFormController>();
    final l10n = AppLocalizations.of(context)!;
    debugPrint('LANGUAGE: ${Localizations.localeOf(context)}');
    debugPrint('REQUEST TYPE: ${l10n.requestType}');
    debugPrint('PERSONAL: ${l10n.personalInformation}');
    debugPrint('COMPANY: ${l10n.companyInformation}');
    debugPrint('CASE: ${l10n.caseDetails}');
    debugPrint('CONSENT: ${l10n.consent}');
    final titles = [
      l10n.requestType,
      l10n.personalInformation,
      l10n.companyInformation,
      l10n.caseDetails,
      l10n.consent,
    ];

    final current = controller.step;
    final width = MediaQuery.of(context).size.width;

    // Responsive sizes
    final bool mobile = width < 600;

    final double itemWidth = mobile ? 72 : 120;
    final double fontSize = mobile ? 10 : 14;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        mobile ? 8 : 20,
        mobile ? 25 : 38,
        mobile ? 8 : 20,
        8,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 920,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < titles.length; i++) ...[
              if (i > 0)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: circleSize / 2 - 1,
                    ),
                    child: Container(
                      height: 2,
                      margin: EdgeInsets.symmetric(
                        horizontal: mobile ? 2 : 8,
                      ),
                      color: i <= current ? primary : border,
                    ),
                  ),
                ),
              SizedBox(
                width: itemWidth,
                child: Column(
                  children: [
                    // Circle
                    _StepCircle(
                      index: i,
                      current: current,
                    ),

                    const SizedBox(height: 10),

                    // Title
                    Text(
                      titles[i],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize,
                        height: 1.2,
                        fontWeight:
                            i == current ? FontWeight.w700 : FontWeight.w400,
                        color: i == current ? primary : text,
                      ),
                    ),
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

class _StepCircle extends StatelessWidget {
  final int index;
  final int current;

  const _StepCircle({
    required this.index,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == current;
    final bool isDone = index < current;
    final bool filled = isActive || isDone;

    return Container(
      width: StepIndicator.circleSize,
      height: StepIndicator.circleSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? StepIndicator.primary : Colors.white,
        border: filled
            ? null
            : Border.all(
                color: StepIndicator.border,
                width: 2,
              ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: StepIndicator.primary.withValues(
                    alpha: 0.18,
                  ),
                  spreadRadius: 6,
                  blurRadius: 1,
                ),
              ]
            : null,
      ),
      child: isDone
          ? const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 22,
            )
          : Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isActive ? Colors.white : StepIndicator.text,
              ),
            ),
    );
  }
}
