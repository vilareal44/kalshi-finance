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

    return Column(
      children: [
        _AnnualIncomeInput(),
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
              onChanged: (annualIncome) =>
                  context.read<WellnessFormCubit>().annualIncomeChanged(
                        int.tryParse(annualIncome),
                      ),
              decoration: InputDecoration(
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

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<WellnessFormCubit, WellnessFormState>(
      builder: (context, state) {
        return AppButton.primary(
          child: Text(l10n.globalContinue),
          onPressed: state.isValid
              ? () {
                  final annualIncome = state.annualIncome;
                  final monthlyCosts = state.monthlyCosts;

                  context.go(
                    '/wellness-score',
                    extra: {
                      'annualIncome': annualIncome,
                      'monthlyCosts': monthlyCosts,
                    },
                  );
                }
              : null,
        );
      },
    );
  }
}
