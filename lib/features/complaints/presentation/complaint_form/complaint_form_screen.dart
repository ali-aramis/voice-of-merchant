import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../home/home_header.dart';
import '../../../home/home_footer.dart';
import '../complaint_form_controller.dart';
import '../step_indicator.dart';

import '../success/complaint_success_screen.dart';
import 'request_type_step.dart';
import 'personal_info_step.dart';
import 'company_info_step.dart';
import 'case_details_step.dart';
import 'consent_step.dart';

class ComplaintFormScreen extends StatelessWidget {
  const ComplaintFormScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ComplaintFormController(),
      child: const _ComplaintFormView(),
    );
  }
}

class _ComplaintFormView extends StatelessWidget {
  const _ComplaintFormView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ComplaintFormController>();

    final width = MediaQuery.of(context).size.width;
    final bool mobile = width < 700;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FC),
      body: Column(
        children: [
          const HomeHeader(),
          const StepIndicator(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mobile ? 16 : 24,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 860,
                      ),
                      child: _FormCard(
                        controller: controller,
                        mobile: mobile,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          const HomeFooter(),
        ],
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final ComplaintFormController controller;
  final bool mobile;

  const _FormCard({
    required this.controller,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        mobile ? 24 : 48,
        58,
        mobile ? 24 : 48,
        34,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 25,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title(controller.step, l10n),
            style: TextStyle(
              color: const Color(0xFF1A2A5E),
              fontSize: mobile ? 24 : 27,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 42),
          _StepContent(
            step: controller.step,
          ),
          const SizedBox(height: 32),
          Container(
            height: 1,
            color: const Color(0xFFE4E8F0),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (controller.isFirst)
                _OutlineButton(
                  text: '  ${l10n.cancel}',
                  onPressed: () {
                    Navigator.of(context).maybePop();                  },
                )
              else
                _OutlineButton(
                  text: '  ${l10n.back}',
                  onPressed: controller.back,
                ),
              _PrimaryButton(
                text: controller.isLast ? l10n.submit : '${l10n.next} ',
                loading: controller.isSubmitting,
                onPressed: () async {
                  final complaintId = await controller.next();

                  if (complaintId != null && context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ComplaintSuccessScreen(
                          complaintId: complaintId,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _title(
    int step,
    AppLocalizations l10n,
  ) {
    switch (step) {
      case 0:
        return l10n.requestType;

      case 1:
        return l10n.personalInformation;

      case 2:
        return l10n.companyInformation;

      case 3:
        return l10n.caseDetails;

      case 4:
        return l10n.consent;

      default:
        return l10n.requestType;
    }
  }
}

class _StepContent extends StatelessWidget {
  final int step;

  const _StepContent({
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    switch (step) {
      case 0:
        return const RequestTypeStep();

      case 1:
        return const PersonalInfoStep();

      case 2:
        return const CompanyInfoStep();

      case 3:
        return const CaseDetailsStep();

      case 4:
        return const ConsentStep();

      default:
        return const RequestTypeStep();
    }
  }
}

class _OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _OutlineButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(150, 58),
        side: const BorderSide(
          color: Color(0xFFDCE3EF),
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF26344F),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
class _PrimaryButton extends StatelessWidget {
  final String text;
  final Future<void> Function() onPressed;
  final bool loading;

  const _PrimaryButton({
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A2A5E),
        foregroundColor: Colors.white,
        minimumSize: const Size(138, 58),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      child: loading
          ? const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      )
          : Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}