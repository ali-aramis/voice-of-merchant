import 'package:flutter/material.dart';

class StepForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Widget child;

  const StepForm({
    super.key,
    required this.formKey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: child,
    );
  }
}

// ============================================================
// Labeled Dropdown
// ============================================================

class LabeledDropdown<T> extends StatelessWidget {
  final String label;
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;

  const LabeledDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });


  Future<void> _openDropdown(
      BuildContext context,
      FormFieldState<T> fieldState,
      ) async {
    debugPrint('Dropdown tapped: $label');
    debugPrint('Dropdown items count: ${items.length}');

    if (!context.mounted) return;

    final double screenHeight = MediaQuery.sizeOf(context).height;

    final selectedValue = await showModalBottomSheet<T>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.65,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18),
        ),
      ),
      builder: (sheetContext) {
        return SizedBox(
          height: screenHeight * 0.55,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFDCE3EF),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: Color(0xFF1A2A5E),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          Navigator.of(sheetContext).pop(),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: items.isEmpty
                    ? const Center(
                  child: Text(
                    'No options available. Please try again.',
                    textAlign: TextAlign.center,
                  ),
                )
                    : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final bool isSelected =
                        item.value == fieldState.value;

                    return ListTile(
                      title: item.child,
                      trailing: isSelected
                          ? const Icon(
                        Icons.check,
                        color: Color(0xFF1A2A5E),
                      )
                          : null,
                      onTap: () {
                        Navigator.of(sheetContext)
                            .pop(item.value);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (!context.mounted || selectedValue == null) return;

    fieldState.didChange(selectedValue);
    onChanged?.call(selectedValue);

    debugPrint('Dropdown selected: $selectedValue');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool mobile = width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(label: label),
        const SizedBox(height: 10),
        FormField<T>(
          initialValue: value,
          validator: validator,
          builder: (fieldState) {
            final bool hasValue = value != null;

            return InkWell(
              borderRadius: BorderRadius.circular(9),
              onTap: () {
                _openDropdown(
                  context,
                  fieldState,
                );
              },
              child: InputDecorator(
                isEmpty: !hasValue,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: const Color(0xFF71809C),
                    fontSize: mobile ? 14 : 16,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: mobile ? 14 : 18,
                    vertical: mobile ? 13 : 15,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF71809C),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: Color(0xFFDCE3EF),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: Color(0xFFDCE3EF),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: Color(0xFF1A2A5E),
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                  errorText: fieldState.errorText,
                ),
                child: hasValue
                    ? DefaultTextStyle(
                        style: TextStyle(
                          color: const Color(0xFF18233A),
                          fontSize: mobile ? 14 : 16,
                        ),
                        child: items
                            .firstWhere(
                              (item) => item.value == value,
                              orElse: () => DropdownMenuItem<T>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                ),
                              ),
                            )
                            .child,
                      )
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}

// ============================================================
// Labeled Text Field
// ============================================================

class LabeledTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool mobile = width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(label: label),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          style: TextStyle(
            color: const Color(0xFF18233A),
            fontSize: mobile ? 14 : 16,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFF71809C),
              fontSize: mobile ? 14 : 16,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: mobile ? 14 : 18,
              vertical: mobile ? 13 : 15,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: Color(0xFFDCE3EF),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: Color(0xFFDCE3EF),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: Color(0xFF1A2A5E),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// Field Label
// ============================================================

class _FieldLabel extends StatelessWidget {
  final String label;

  const _FieldLabel({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1A2A5E),
        ),
        children: const [
          TextSpan(
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
