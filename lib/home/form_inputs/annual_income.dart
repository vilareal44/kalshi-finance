import 'package:formz/formz.dart';

/// AnnualIncome Form Input Validation Error
enum AnnualIncomeValidationError {
  /// AnnualIncome is required
  required,

  /// AnnualIncome is invalid
  zero,
}

/// {@template AnnualIncome}
/// Reusable AnnualIncome form input.
/// {@endtemplate}
class AnnualIncome extends FormzInput<int?, AnnualIncomeValidationError> {
  /// {@macro AnnualIncome}
  const AnnualIncome.pure() : super.pure(null);

  /// {@macro AnnualIncome}
  const AnnualIncome.dirty([super.value = 0]) : super.dirty();

  @override
  AnnualIncomeValidationError? validator(int? value) {
    return value == null
        ? AnnualIncomeValidationError.required
        : value == 0
            ? AnnualIncomeValidationError.zero
            : null;
  }
}
