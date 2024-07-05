import 'package:design_system/src/colors/app_colors.dart';
import 'package:flutter/material.dart';

///
/// The default app's [TextTheme] is [AppTheme.uiTextTheme].
///
/// Use [ContentThemeOverrideBuilder] to override the default [TextTheme]
/// to [AppTheme.contentTextTheme].

/// UI Text Style Definitions
abstract class UITextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'design_system',
    fontWeight: FontWeight.w400,
    fontFamily: 'WorkSans',
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  /// subtitle style with 18px font size
  static final TextStyle subtitle = _baseTextStyle.copyWith(
    fontSize: 18,
    color: AppColors.primary,
  );

  /// subtitle style with 18px font size and semibold weight
  static final TextStyle subtitleSemibold = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  /// paragraph style with 14px font size
  static final TextStyle paragraph = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.lightGray,
  );

  /// paragraph style with 14px font size and semibold weight
  static final TextStyle paragraphSemibold = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.lightGray,
  );

  /// description style with 12px font size and bold weight
  static final TextStyle description = _baseTextStyle.copyWith(
    fontSize: 12,
    color: AppColors.darkGray,
  );

  /// button style with 16px font size
  static final TextStyle button = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
  );

  /// heading style with 20px font size
  static TextStyle headingSmall = _baseTextStyle.copyWith(
    fontFamily: 'Rubik',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
  );
}
