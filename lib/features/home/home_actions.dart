import 'package:flutter/material.dart';
import 'package:vom/features/track_complaint/track_case_screen.dart';
import '../../../core/localization/app_localizations.dart';
import '../../app/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../complaints/presentation/complaint_form/complaint_form_screen.dart';

class HomeActions extends StatelessWidget {
  const HomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final submit = ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ComplaintFormScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(0, 60),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: const Icon(Icons.note_add_outlined, size: 24),
      label: Text(l10n.submitComplaint),
    );

    final track = OutlinedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const TrackCaseScreen(),
          ),
        );
      },
      icon: const Icon(Icons.search, size: 25),
      label: Text(l10n.trackCase),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 20 : 30,
        vertical: context.isMobile ? 28 : 40,
      ),
      child: context.isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [submit, const SizedBox(height: 14), track],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 330, child: submit),
          const SizedBox(width: 18),
          SizedBox(width: 240, child: track),
        ],
      ),
    );
  }
}