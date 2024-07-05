import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final int annualIncome;
  final int monthlyCosts;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
    final l10n = context.l10n;

    return Scaffold(
      appBar: const DefaultAppBar().build(context),
      backgroundColor: AppColors.background,
      body: const Column(
        children: [
          _Headline(),
          _Card(),
          DisclaimerEncrypted(),
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
      text: TextSpan(
        text: l10n.wellnessResultDisplayTitleRegular,
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
