import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi_finance/home/cubit/wellness_form_cubit.dart';
import 'package:kalshi_finance/home/form_inputs/form_inputs.dart';
import 'package:kalshi_finance/l10n/l10n.dart';

class WellnessForm extends StatelessWidget {
  const WellnessForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _AnnualIncomeInput(),
        SizedBox(height: AppSpacing.lg),
        _MontlyCostsInput(),
        SizedBox(height: AppSpacing.lg),
        _ContinueButton(),
      ],
    );
  }
}

class _AnnualIncomeInput extends StatelessWidget {
  const _AnnualIncomeInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<WellnessFormCubit, WellnessFormState>(
      buildWhen: (previous, current) =>
          previous.annualIncome != current.annualIncome,
      builder: (context, state) {
        return AppTextInput(
          label: l10n.wellnessAnnualIncomeInputLabel,
          onChanged: (annualIncome) =>
              context.read<WellnessFormCubit>().annualIncomeChanged(
                    int.tryParse(annualIncome),
                  ),
          errorText: state.annualIncome.displayError ==
                  AnnualIncomeValidationError.required
              ? l10n.wellnessAnnualIncomeRequiredInputError
              : state.annualIncome.displayError ==
                      AnnualIncomeValidationError.zero
                  ? l10n.wellnessAnnualIncomeZeroValueError
                  : null,
        );
      },
    );
  }
}

class _MontlyCostsInput extends StatelessWidget {
  const _MontlyCostsInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<WellnessFormCubit, WellnessFormState>(
      buildWhen: (previous, current) =>
          previous.monthlyCosts != current.monthlyCosts,
      builder: (context, state) {
        return AppTextInput(
          label: l10n.wellnessMonthlyCostInputLabel,
          onChanged: (monthlyCosts) =>
              context.read<WellnessFormCubit>().monthlyCostsChanged(
                    int.tryParse(monthlyCosts),
                  ),
          errorText: state.monthlyCosts.displayError ==
                  MonthlyCostsValidationError.required
              ? l10n.wellnessMonthlyCostsRequiredInputError
              : state.monthlyCosts.displayError ==
                      MonthlyCostsValidationError.zero
                  ? l10n.wellnessMonthlyCostsZeroValueError
                  : null,
        );
      },
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<WellnessFormCubit, WellnessFormState>(
      builder: (context, state) {
        return AppButton.primary(
          onPressed: state.isValid
              ? () {
                  final annualIncome = state.annualIncome.value;
                  final monthlyCosts = state.monthlyCosts.value;

                  context.go(
                    '/wellness-score',
                    extra: {
                      'annualIncome': annualIncome,
                      'monthlyCosts': monthlyCosts,
                    },
                  );
                }
              : null,
          child: Text(l10n.globalContinue),
        );
      },
    );
  }
}
