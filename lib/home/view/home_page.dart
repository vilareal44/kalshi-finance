import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi_finance/home/cubit/wellness_form_cubit.dart';
import 'package:kalshi_finance/home/home.dart';
import 'package:kalshi_finance/home/widgets/widgets.dart';
import 'package:kalshi_finance/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WellnessFormCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBasePage(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          SizedBox(height: AppSpacing.xlg),
          _Headline(),
          SizedBox(height: AppSpacing.xlg),
          _Card(),
          SizedBox(height: AppSpacing.xlg),
          DisclaimerEncrypted(),
          SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: l10n.wellnessDiplayTitleRegular,
        style: UITextStyle.subtitle,
        children: <TextSpan>[
          TextSpan(
            text: l10n.wellnessDisplayTitleBold,
            style: UITextStyle.subtitleSemibold,
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppCard(
      child: Column(
        children: [
          const AppIcon(),
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.wellnessTestTitle,
            style: UITextStyle.headingSmall,
          ),
          Text(
            l10n.wellnessTestSubtitle,
            style: UITextStyle.paragraph,
          ),
          const SizedBox(height: AppSpacing.lg),
          const WellnessForm(),
        ],
      ),
    );
  }
}
