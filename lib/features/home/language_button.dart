import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/language_provider.dart';
import '../../app/app_colors.dart';
import '../../core/utils/responsive.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isEnglish = context.select<LanguageProvider, bool>(
          (provider) => provider.locale.languageCode == 'en',
    );
    final bool compact = context.isMobile;
    final String label = isEnglish ? 'العربية' : 'English';

    return Semantics(
      button: true,
      label: 'Change language to $label',
      excludeSemantics: true,
      child: Material(
        color: AppColors.surface,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.borderLight),
        ),
        child: InkWell(
          onTap: () => context.read<LanguageProvider>().changeLanguage(
            isEnglish ? const Locale('ar') : const Locale('en'),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 12 : 18,
              vertical: 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.language,
                  size: compact ? 19 : 22,
                  color: AppColors.languageText,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.languageText,
                    fontSize: compact ? 12 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}