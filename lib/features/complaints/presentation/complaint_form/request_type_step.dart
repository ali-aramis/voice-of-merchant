
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/validators/validators.dart';
import '../complaint_form_controller.dart';
import '../form_fields.dart';

class RequestTypeStep extends StatelessWidget {
  const RequestTypeStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ComplaintFormController>();
    final l10n = AppLocalizations.of(context)!;
    debugPrint(
      'Submission Types: ${controller.submissionTypes.length}',
    );

    debugPrint(
      'Submission Type Selected: ${controller.submissionType}',
    );

    debugPrint(
      'Entities: ${controller.entities.length}',
    );

    debugPrint(
      'Entity Selected: ${controller.entity}',
    );
    return StepForm(
      formKey: controller.formKeys[0],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Submission Type
          LabeledDropdown<String>(
            label: l10n.submissionType,
            hint: l10n.submissionType,
            value: controller.submissionType,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
            onChanged: controller.setSubmissionType,
            items: controller.submissionTypes.map((type) {


              return DropdownMenuItem<String>(
                value: type.id,
                child: Text(
                  '${type.nameEn} / ${type.nameAr}',
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 26),

          // Entity
          LabeledDropdown<String>(
            label: l10n.entity,
            hint: l10n.selectEntity,
            value: controller.entity,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
            onChanged: controller.setEntity,
            items: controller.entities.map((entity) {


              return DropdownMenuItem<String>(
                value: entity.id,
                child: Text(
                  '${entity.nameEn} / ${entity.nameAr}',
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
