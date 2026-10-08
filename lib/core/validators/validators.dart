import '../localization/app_localizations.dart';

class Validators {
  static String? required(
      String? value,
      AppLocalizations l10n,
      ) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldRequired;
    }

    return null;
  }

  static String? email(
      String? value,
      AppLocalizations l10n,
      ) {
    if (value == null || value.trim().isEmpty) {
      return l10n.emailRequired;
    }

    final emailRegex = RegExp(
      r'^[\w.-]+@[\w.-]+\.\w+$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return l10n.invalidEmail;
    }

    return null;
  }

  static String? emailOrMobile(
      String? value,
      AppLocalizations l10n,
      ) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldRequired;
    }

    final input = value.trim();

    final emailRegex = RegExp(
      r'^[\w.-]+@[\w.-]+\.\w+$',
    );

    final mobileRegex = RegExp(
      r'^[0-9]{8,15}$',
    );

    if (!emailRegex.hasMatch(input) &&
        !mobileRegex.hasMatch(input)) {
      return l10n.invalidEmailOrMobile;
    }

    return null;
  }
  static String? crNumber(
      String? value,
      AppLocalizations l10n,
      ) {
    // CR Number optional hai
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final input = value.trim();

    final crRegex = RegExp(r'^[0-9]+$');

    if (!crRegex.hasMatch(input)) {
      return l10n.invalidCrNumber;
    }

    return null;
  }
}
