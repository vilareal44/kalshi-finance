import 'package:design_system/design_system.dart';
import 'package:design_system/src/design_system.dart';
import 'package:flutter/material.dart';

/// Wellness result chart widget
class AppWellnessChart extends StatelessWidget {
  /// Wellness result chart widget
  const AppWellnessChart({
    required this.coloredCount,
    super.key,
  }) : assert(
          coloredCount >= 0 && coloredCount <= 3,
          'coloredCount must be between 0 and 3',
        );

  /// Number of colored itens
  final int coloredCount;

  @override
  Widget build(BuildContext context) {
    final selectedColor = coloredCount == 3
        ? AppColors.green
        : coloredCount == 2
            ? AppColors.yellow
            : AppColors.red;

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          constraints: const BoxConstraints(
            minWidth: 256,
            maxWidth: 256,
            minHeight: 16,
            maxHeight: 16,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white, width: 2),
            borderRadius: BorderRadius.circular(32),
            color: coloredCount == 3 ? selectedColor : AppColors.background,
          ),
        ),
        Container(
          constraints: const BoxConstraints(
            minWidth: 169,
            maxWidth: 169,
            minHeight: 16,
            maxHeight: 16,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white, width: 2),
            borderRadius: BorderRadius.circular(32),
            color: coloredCount >= 2 ? selectedColor : AppColors.background,
          ),
        ),
        Container(
          constraints: const BoxConstraints(
            minWidth: 85,
            maxWidth: 85,
            minHeight: 16,
            maxHeight: 16,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white, width: 2),
            borderRadius: BorderRadius.circular(32),
            color: coloredCount >= 1 ? selectedColor : AppColors.background,
          ),
        ),
      ],
    );
  }
}
