import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:kalshi_finance/l10n/l10n.dart';

class DisclaimerEncrypted extends StatelessWidget {
  const DisclaimerEncrypted({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        Text('icon'),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        Text(l10n.globalEncryptedDataDisclaimer),
      ],
    );
  }
}
