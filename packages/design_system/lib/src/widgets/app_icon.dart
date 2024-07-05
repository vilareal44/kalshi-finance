import 'package:design_system/src/generated/assets.gen.dart';
import 'package:flutter/material.dart';

/// Application icon.
class AppIcon extends StatelessWidget {
  /// Application icon.
  const AppIcon({
    super.key,
  });

  @override
  Widget build(Object context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Assets.kalshiIcon.svg(),
    );
  }
}
