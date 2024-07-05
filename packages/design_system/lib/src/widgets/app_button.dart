import 'package:design_system/src/colors/app_colors.dart';
import 'package:design_system/src/typography/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Variation of the button.
enum ButtonVariation {
  /// filled button variation
  filled,

  /// outlined button variation
  outlined
}

/// {@template app_button}
/// Button with text displayed in the application.
/// {@endtemplate}
class AppButton extends StatelessWidget {
  /// {@macro app_button}
  const AppButton._({
    required this.child,
    this.onPressed,
    ButtonVariation? variation,
    super.key,
  }) : _variation = variation ?? ButtonVariation.filled;

  /// Creates a primary Filled button.
  const AppButton.primary({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
  }) : this._(
          child: child,
          key: key,
          onPressed: onPressed,
          variation: ButtonVariation.filled,
        );

  /// Creates a primary Outlined button.
  const AppButton.outlined({
    required Widget child,
    Key? key,
    VoidCallback? onPressed,
  }) : this._(
          child: child,
          key: key,
          onPressed: onPressed,
          variation: ButtonVariation.outlined,
        );

  /// The maximum size of the button.
  static const _defaultMaximumSize = Size(double.infinity, 56);

  /// The minimum size of the button.
  static const _defaultMinimumSize = Size(double.infinity, 56);

  /// [VoidCallback] called when button is pressed.
  /// Button is disabled when null.
  final VoidCallback? onPressed;

  /// [Widget] displayed on the button.
  final Widget child;

  /// variation of the button.
  final ButtonVariation _variation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(_defaultMinimumSize),
        maximumSize: WidgetStateProperty.all(_defaultMaximumSize),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.resolveWith<Color>(_backgroundColor),
        side: WidgetStateProperty.all<BorderSide?>(
          _borderSide(),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          UITextStyle.button.copyWith(
            color: _foregroundColor(),
          ),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          _foregroundColor(),
        ),
      ),
      child: child,
    );
  }

  Color _backgroundColor(Set<WidgetState> states) {
    return _variation == ButtonVariation.filled
        ? states.contains(WidgetState.disabled)
            ? AppColors.lightBlue
            : AppColors.primary
        : AppColors.white;
  }

  BorderSide? _borderSide() {
    return _variation == ButtonVariation.outlined
        ? const BorderSide(width: 2, color: AppColors.primary)
        : null;
  }

  Color _foregroundColor() {
    return _variation == ButtonVariation.filled
        ? AppColors.white
        : AppColors.primary;
  }
}
