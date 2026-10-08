import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vom/core/localization/app_localizations.dart';

import '../../../../core/validators/validators.dart';
import '../complaint_form_controller.dart';
import '../form_fields.dart';

  class CompanyInfoStep extends StatelessWidget {
  const CompanyInfoStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ComplaintFormController>();
    final l10n = AppLocalizations.of(context)!;

    return StepForm(
      formKey: controller.formKeys[2],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledTextField(
            label: l10n.companyName,
            hint: l10n.enterCompanyName,
            controller: controller.companyName,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
          ),

          const SizedBox(height: 24),

          LabeledTextField(
            label: l10n.crNumber,
            hint: l10n.enterCrNumber,
            controller: controller.crNumber,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
          ),

          const SizedBox(height: 24),

          LabeledTextField(
            label: l10n.bcciMembershipNumber,
            hint: l10n.enterBcciMembership,
            controller: controller.bcciMembership,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
          ),
        ],
      ),
    );
  }
}