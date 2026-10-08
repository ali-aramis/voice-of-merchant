import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vom/features/home/home_screen.dart';
import '../core/localization/app_localizations.dart';
import '../providers/language_provider.dart';
import 'app_theme.dart';

class ComplaintApp extends StatelessWidget {
  const ComplaintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: buildTheme(),
            locale: languageProvider.locale,
            localizationsDelegates:
            AppLocalizations.localizationsDelegates,
            supportedLocales:
            AppLocalizations.supportedLocales,

            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}