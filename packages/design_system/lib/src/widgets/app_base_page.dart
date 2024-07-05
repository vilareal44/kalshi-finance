import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// A base page for the app that provides a scaffold with a centered container
class AppBasePage extends StatelessWidget {
  /// Creates a base page for the app
  const AppBasePage({
    required this.child,
    super.key,
    this.backgroundColor = AppColors.background,
  });

  /// The child widget to display in the center of the page
  final Widget child;

  /// The background color of the page
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar().build(context),
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
