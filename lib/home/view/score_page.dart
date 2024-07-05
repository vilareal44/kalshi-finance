// ignore_for_file: no_default_cases

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi_finance/home/cubit/wellness_score_cubit.dart';
import 'package:kalshi_finance/home/home.dart';
import 'package:kalshi_finance/home/widgets/widgets.dart';
import 'package:kalshi_finance/l10n/l10n.dart';
import 'package:wellness_repository/wellness_repository.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({
    required this.annualIncome,
    required this.monthlyCosts,
    super.key,
  });

  final int? annualIncome;
  final int? monthlyCosts;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => WellnessScoreCubit(
        wellnessRepository: context.read<WellnessRepository>(),
      )..calculateWellnessScore(
          annualIncome: annualIncome,
          monthlyCosts: monthlyCosts,
        ),
      child: const ScoreView(),
    );
  }
}

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBasePage(
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
        text: l10n.wellnessResultDisplayTitleRegular,
        style: UITextStyle.subtitle,
        children: <TextSpan>[
          TextSpan(
            text: l10n.wellnessResultDisplayTitleBold,
            style: UITextStyle.subtitleSemibold,
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({super.key});

  int _getColoredCount(WellnessScore wellnessScore) {
    return wellnessScore == WellnessScore.healthy
        ? 3
        : wellnessScore == WellnessScore.medium
            ? 2
            : 1;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<WellnessScoreCubit, WellnessScore>(
      builder: (context, wellnessScore) {
        return AppCard(
          child: Column(
            children: [
              const AppIcon(),
              const SizedBox(height: AppSpacing.xlg),
              AppWellnessChart(coloredCount: _getColoredCount(wellnessScore)),
              const SizedBox(height: AppSpacing.xlg),
              _WellnessResultDescription(wellnessScore: wellnessScore),
              const SizedBox(height: AppSpacing.xlg + AppSpacing.sm),
              const _ReturnButton(),
            ],
          ),
        );
      },
    );
  }
}

class _WellnessResultDescription extends StatelessWidget {
  const _WellnessResultDescription({
    required this.wellnessScore,
    super.key,
  });

  final WellnessScore wellnessScore;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    var title = '';
    var subtitle = '';
    var subtitleBold = '';

    switch (wellnessScore) {
      case WellnessScore.healthy:
        title = l10n.wellnessScoreHealthlyTitle;
        subtitle = l10n.wellnessScoreHealthlySubtitle;
        subtitleBold = l10n.wellnessScoreHealthlySubtitleBold;
      case WellnessScore.medium:
        title = l10n.wellnessScoreAverageTitle;
        subtitle = l10n.wellnessScoreAverageSubtitle;
        subtitleBold = l10n.wellnessScoreAverageSubtitleBold;
      case WellnessScore.low:
        title = l10n.wellnessScoreUnhealthyTitle;
        subtitle = l10n.wellnessScoreUnhealthySubtitle;
        subtitleBold = l10n.wellnessScoreUnhealthySubtitleBold;
      default:
        title = 'Unknown';
        subtitle = 'Unknown';
        subtitleBold = '';
        break;
    }

    return Column(
      children: [
        Text(
          title,
          style: UITextStyle.headingSmall,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: subtitle,
            style: UITextStyle.paragraph,
            children: <TextSpan>[
              TextSpan(
                text: subtitleBold,
                style: UITextStyle.paragraphSemibold.copyWith(height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReturnButton extends StatelessWidget {
  const _ReturnButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppButton.outlined(
      onPressed: () => context.canPop() ? context.pop() : context.go('/home'),
      child: Text(l10n.globalReturn),
    );
  }
}
