import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/validators/validators.dart';
import '../complaint_form_controller.dart';
import '../form_fields.dart';

class PersonalInfoStep extends StatelessWidget {
  const PersonalInfoStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ComplaintFormController>();
    final l10n = AppLocalizations.of(context)!;

    return StepForm(
      formKey: controller.formKeys[1],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name
          LabeledTextField(
            label: l10n.fullName,
            hint: l10n.enterYourFullName,
            controller: controller.fullName,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
          ),

          const SizedBox(height: 24),

          // CPR / Passport Number
          LabeledTextField(
            label: l10n.cprPassportNumber,
            hint: l10n.enterYourIdNumber,
            controller: controller.idNumber,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
          ),

          const SizedBox(height: 24),

          // Position
          LabeledDropdown<String>(
            label: l10n.position,
            hint: l10n.selectPosition,
            value: controller.position,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
            onChanged: controller.setPosition,
            items: controller.positions.map((position) {
              return DropdownMenuItem<String>(
                value: position.id,
                child: Text(
                  '${position.nameEn} / ${position.nameAr}',
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Phone Number
          LabeledTextField(
            label: l10n.mobileNumber,
            hint: l10n.enterYourPhoneNumber,
            controller: controller.phone,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
          ),

          const SizedBox(height: 24),

          // Email
          LabeledTextField(
            label: l10n.email,
            hint: l10n.enterYourEmail,
            controller: controller.email,
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