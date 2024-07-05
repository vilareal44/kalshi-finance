import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi_finance/home/cubit/wellness_form_cubit.dart';
import 'package:kalshi_finance/home/form_inputs/form_inputs.dart';
import 'package:kalshi_finance/l10n/l10n.dart';

class WellnessForm extends StatelessWidget {
  const WellnessForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.wellnessAnnualIncomeInputLabel,
              style: UITextStyle.description,
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              style: UITextStyle.headingSmall.copyWith(fontSize: 24),
              onChanged: (annualIncome) =>
                  context.read<WellnessFormCubit>().annualIncomeChanged(
                        int.tryParse(annualIncome),
                      ),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: AppSpacing.md,
                    end: AppSpacing.md,
                  ),
                  child: Assets.dollarSign.svg(),
                ),
                hintText: '0',
                border: const OutlineInputBorder(),
                errorText: state.annualIncome.displayError ==
                        AnnualIncomeValidationError.required
                    ? l10n.wellnessAnnualIncomeRequiredInputError
                    : state.annualIncome.displayError ==
                            AnnualIncomeValidationError.zero
                        ? l10n.wellnessAnnualIncomeZeroValueError
                        : null,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.extraLightGray),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
            ),
          ],
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.wellnessMonthlyCostInputLabel,
              style: UITextStyle.description,
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              onChanged: (monthlyCosts) =>
                  context.read<WellnessFormCubit>().monthlyCostsChanged(
                        int.tryParse(monthlyCosts),
                      ),
              decoration: InputDecoration(
                hintText: '0',
                border: const OutlineInputBorder(),
                errorText: state.monthlyCosts.displayError ==
                        MonthlyCostsValidationError.required
                    ? l10n.wellnessMonthlyCostsRequiredInputError
                    : state.monthlyCosts.displayError ==
                            MonthlyCostsValidationError.zero
                        ? l10n.wellnessMonthlyCostsZeroValueError
                        : null,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.extraLightGray),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
            ),
          ],
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
