import 'package:design_system/src/generated/assets.gen.dart';
import 'package:flutter/material.dart';

/// Application logo.
class AppLogo extends StatelessWidget {
  /// Application logo.
  const AppLogo({
    super.key,
  });

  @override
  Widget build(Object context) {
    return SizedBox(
      width: 80,
      height: 22,
      child: Assets.kalshiLogoBlack.svg(),
    );
  }
}
