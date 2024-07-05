import 'package:design_system/src/colors/app_colors.dart';
import 'package:design_system/src/widgets/app_logo.dart';
import 'package:flutter/material.dart';

/// Default App bar for the application.
class DefaultAppBar extends StatelessWidget {
  /// Default App bar for the application.
  const DefaultAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: const AppLogo(),
      centerTitle: true,
    );
  }
}
