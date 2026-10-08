import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/localization/app_localizations.dart';
import '../complaint_form_controller.dart';

class ConsentStep extends StatelessWidget {
  const ConsentStep({
    super.key,
  });

  static const Color primary = Color(0xFF1A2A5E);
  static const Color textColor = Color(0xFF33415C);
  static const Color labelColor = Color(0xFF65738C);
  static const Color borderColor = Color(0xFFDCE3EF);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ComplaintFormController>();
    final l10n = AppLocalizations.of(context)!;

    final width = MediaQuery.of(context).size.width;
    final bool mobile = width < 700;

    return Form(
      key: controller.formKeys[4],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==========================================================
          // REQUEST TYPE
          // ==========================================================

          _SectionTitle(
            title: l10n.submissionType,
          ),

          _InfoGrid(
            mobile: mobile,
            children: [
              _InfoItem(
                label: l10n.submissionType,
                value: controller.selectedSubmissionTypeName,
              ),
              _InfoItem(
                label: l10n.entity,
                value: controller.selectedEntityName,
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ==========================================================
          // PERSONAL INFORMATION
          // ==========================================================

          _SectionTitle(
            title: l10n.personalInformation,
          ),

          _InfoGrid(
            mobile: mobile,
            children: [
              _InfoItem(
                label: l10n.fullName,
                value: controller.fullName.text,
              ),
              _InfoItem(
                label: l10n.email,
                value: controller.email.text,
              ),
              _InfoItem(
                label: l10n.mobileNumber,
                value: controller.phone.text,
              ),
              _InfoItem(
                label: l10n.cprPassportNumber,
                value: controller.idNumber.text,
              ),
              _InfoItem(
                label: l10n.position,
                value: _getPositionName(controller),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ==========================================================
          // COMPANY INFORMATION
          // ==========================================================

          _SectionTitle(
            title: l10n.companyInformation,
          ),

          _InfoGrid(
            mobile: mobile,
            children: [
              _InfoItem(
                label: l10n.companyName,
                value: controller.companyName.text,
              ),
              _InfoItem(
                label: l10n.crNumber,
                value: controller.crNumber.text,
              ),
              _InfoItem(
                label: l10n.bcciMembershipNumber,
                value: controller.bcciMembership.text,
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ==========================================================
          // CASE DETAILS
          // ==========================================================

          _SectionTitle(
            title: l10n.caseDetails,
          ),

          _InfoGrid(
            mobile: mobile,
            children: [
              _InfoItem(
                label: l10n.subject,
                value: controller.subject.text,
              ),
              _InfoItem(
                label: l10n.description,
                value: controller.description.text,
                fullWidth: true,
              ),
              _InfoItem(
                label: l10n.suggestionSummary,
                value: controller.suggestionSummary.text,
                fullWidth: true,
              ),
              _InfoItem(
                label: l10n.requestedResolution,
                value: controller.requestedResolution.text,
                fullWidth: true,
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ==========================================================
          // CONSENT
          // ==========================================================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FD),
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: controller.consent,
                  onChanged: (value) {
                    controller.setConsent(value ?? false);
                  },
                  activeColor: primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      l10n.consentConfirmation,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (controller.consentValidationAttempted &&
              !controller.consent)
            Padding(
              padding: const EdgeInsets.only(
                left: 4,
                top: 8,
              ),
              child: Text(
                l10n.consentRequired,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ================================================================
  // POSITION NAME
  // ================================================================

  String _getPositionName(ComplaintFormController controller) {
    for (final item in controller.positions) {
      if (item.id.toString() == controller.position) {
        return '${item.nameEn} / ${item.nameAr}';
      }
    }

    return '-';
  }
}

// ==================================================================
// SECTION TITLE
// ==================================================================

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
        top: 8,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: ConsentStep.primary,
        ),
      ),
    );
  }
}

// ==================================================================
// INFO GRID
// ==================================================================

class _InfoGrid extends StatelessWidget {
  final bool mobile;
  final List<_InfoItem> children;

  const _InfoGrid({
    required this.mobile,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    if (mobile) {
      return Column(
        children: children,
      );
    }

    final List<Widget> rows = [];

    int index = 0;

    while (index < children.length) {
      final current = children[index];

      if (current.fullWidth) {
        rows.add(current);
        index++;
        continue;
      }

      if (index + 1 < children.length &&
          !children[index + 1].fullWidth) {
        rows.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: current,
              ),
              const SizedBox(width: 40),
              Expanded(
                child: children[index + 1],
              ),
            ],
          ),
        );

        index += 2;
      } else {
        rows.add(current);
        index++;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows,
    );
  }
}

// ==================================================================
// INFO ITEM
// ==================================================================

class _InfoItem extends StatelessWidget {
  final String label;
  final String? value;
  final bool fullWidth;

  const _InfoItem({
    required this.label,
    required this.value,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ConsentStep.labelColor,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            value == null || value!.trim().isEmpty
                ? '-'
                : value!,
            style: const TextStyle(
              fontSize: 15,
              height: 1.4,
              color: ConsentStep.textColor,
            ),
          ),
        ],
      ),
    );
  }
}