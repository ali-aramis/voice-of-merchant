import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vom/core/localization/app_localizations.dart';
import '../../../../core/validators/validators.dart';
import '../complaint_form_controller.dart';
import '../form_fields.dart';

class CaseDetailsStep extends StatelessWidget {
  const CaseDetailsStep({
    super.key,
  });

  static const Color primary = Color(0xFF1A2A5E);
  static const Color border = Color(0xFFDCE3ED);
  static const Color hintColor = Color(0xFF98A6BC);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ComplaintFormController>();
    final l10n = AppLocalizations.of(context)!;

    return StepForm(
      formKey: controller.formKeys[3],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =========================
          // TITLE
          // =========================
          // Text(
          //   l10n.caseDetails,
          //   style: const TextStyle(
          //     fontSize: 22,
          //     fontWeight: FontWeight.w700,
          //     color: primary,
          //   ),
          // ),

          const SizedBox(height: 32),

          // =========================
          // SUGGESTION SUMMARY
          // =========================
          _FieldLabel(
            label: l10n.suggestionSummary,
            required: true,
          ),

          const SizedBox(height: 8),

          _CaseTextField(
            controller: controller.subject,
            hintText: l10n.suggestionSummaryHint,
            maxLines: 5,
            maxLength: 700,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
          ),

          const SizedBox(height: 8),

          _CharacterCount(
            controller: controller.subject,
          ),

          const SizedBox(height: 26),

          // =========================
          // REQUESTED RESOLUTION
          // =========================
          _FieldLabel(
            label: l10n.requestedResolution,
            required: true,
          ),

          const SizedBox(height: 8),

          _CaseTextField(
            controller: controller.description,
            hintText: l10n.requestedResolutionHint,
            maxLines: 5,
            maxLength: 700,
            validator: (value) => Validators.required(
              value,
              l10n,
            ),
          ),

          const SizedBox(height: 8),

          _CharacterCount(
            controller: controller.description,
          ),

          const SizedBox(height: 26),

          // =========================
          // UPLOAD DOCUMENTS
          // =========================
          _FieldLabel(
            label: l10n.uploadDocuments,
            required: false,
          ),

          const SizedBox(height: 8),

          _UploadBox(
            browseFilesText: l10n.browseFiles,
            dragDropText: l10n.dragAndDropFiles,
            uploadHint: l10n.uploadDocumentsHint,
          ),

          const SizedBox(height: 8),

          Text(
            l10n.uploadDocumentsInfo,
            style: const TextStyle(
              fontSize: 11,
              height: 1.5,
              color: Color(0xFF71819A),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// FIELD LABEL
// =====================================================

class _FieldLabel extends StatelessWidget {
  final String label;
  final bool required;

  const _FieldLabel({
    required this.label,
    required this.required,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: CaseDetailsStep.primary,
        ),
        children: [
          if (required)
            const TextSpan(
              text: ' *',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}

// =====================================================
// TEXT FIELD
// =====================================================

class _CaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final int maxLength;
  final String? Function(String?)? validator;

  const _CaseTextField({
    required this.controller,
    required this.hintText,
    required this.maxLines,
    required this.maxLength,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      style: const TextStyle(
        fontSize: 13,
        color: CaseDetailsStep.primary,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CaseDetailsStep.hintColor,
          fontSize: 13,
        ),
        counterText: '',
        contentPadding: const EdgeInsets.all(14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: CaseDetailsStep.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: CaseDetailsStep.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: CaseDetailsStep.primary,
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

// =====================================================
// CHARACTER COUNT
// =====================================================

class _CharacterCount extends StatefulWidget {
  final TextEditingController controller;

  const _CharacterCount({
    required this.controller,
  });

  @override
  State<_CharacterCount> createState() => _CharacterCountState();
}

class _CharacterCountState extends State<_CharacterCount> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.controller.text.length} / 700',
      style: const TextStyle(
        fontSize: 11,
        color: Color(0xFF71819A),
      ),
    );
  }
}

// =====================================================
// UPLOAD BOX
// =====================================================
class _UploadBox extends StatelessWidget {
  final String browseFilesText;
  final String dragDropText;
  final String uploadHint;

  const _UploadBox({
    required this.browseFilesText,
    required this.dragDropText,
    required this.uploadHint,
  });

  Future<void> _pickFile(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'jpg', 'jpeg', 'png'],
      );

      if (result == null) return;

      final file = result.files.first;

      debugPrint('Selected file: ${file.name}');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Selected: ${file.name}'),
          ),
        );
      }
    } catch (e) {
      debugPrint('File picker error: $e');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unable to select file: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 178,
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFE),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: CaseDetailsStep.primary,
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.upload_outlined,
            size: 32,
            color: Color(0xFF71819A),
          ),

          const SizedBox(height: 18),

          Text(
            dragDropText,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF71819A),
            ),
          ),

          const SizedBox(height: 6),

          TextButton(
            onPressed: () => _pickFile(context),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              browseFilesText,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: CaseDetailsStep.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}