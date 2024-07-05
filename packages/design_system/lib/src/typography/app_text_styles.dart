import 'package:design_system/src/colors/app_colors.dart';
import 'package:flutter/material.dart';

/// UI Text Style Definitions
abstract class UITextStyle {
  /// subtitle style with 18px font size
  static const TextStyle subtitle = TextStyle(
    fontFamily: 'WorkSans',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  /// subtitle style with 18px font size and semibold weight
  static const TextStyle subtitleSemibold = TextStyle(
    fontFamily: 'WorkSans',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  /// paragraph style with 14px font size
  static const TextStyle paragraph = TextStyle(
    fontFamily: 'WorkSans',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.lightGray,
  );

  /// paragraph style with 14px font size and semibold weight
  static const TextStyle paragraphSemibold = TextStyle(
    fontFamily: 'WorkSans',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.lightGray,
  );

  /// description style with 12px font size and bold weight
  static const TextStyle description = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.darkGray,
  );

  /// button style with 16px font size
  static const TextStyle button = TextStyle(
    fontFamily: 'WorkSans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
  );

  /// heading style with 20px font size
  static TextStyle headingSmall = const TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
  );
}
