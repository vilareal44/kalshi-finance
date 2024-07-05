import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text input field for the wellness form.
class AppTextInput extends StatelessWidget {
  /// Creates a new text input field.
  const AppTextInput({
    required this.label,
    this.errorText,
    this.onChanged,
    super.key,
  });

  /// The label of the input field.
  final String label;

  /// The error text to display if the input is invalid.
  final String? errorText;

  /// The callback to call when the input changes.
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: UITextStyle.description,
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          style: UITextStyle.headingSmall.copyWith(fontSize: 24),
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: AppSpacing.md,
                end: AppSpacing.md,
              ),
              child: Assets.dollarSign.svg(),
            ),
            hintText: '0',
            border: const OutlineInputBorder(),
            errorText: errorText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.extraLightGray),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
            ),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            // CurrencyFormatter(),
          ],
        ),
      ],
    );
  }
}
