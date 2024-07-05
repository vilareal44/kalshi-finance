import 'package:formz/formz.dart';

/// MonthlyCosts Form Input Validation Error
enum MonthlyCostsValidationError {
  /// MonthlyCosts is required
  required,

  /// MonthlyCosts is invalid
  zero,
}

/// {@template MonthlyCosts}
/// Reusable MonthlyCosts form input.
/// {@endtemplate}
class MonthlyCosts extends FormzInput<int?, MonthlyCostsValidationError> {
  /// {@macro MonthlyCosts}
  const MonthlyCosts.pure() : super.pure(null);

  /// {@macro MonthlyCosts}
  const MonthlyCosts.dirty([super.value = 0]) : super.dirty();

  @override
  MonthlyCostsValidationError? validator(int? value) {
    return value == null
        ? MonthlyCostsValidationError.required
        : value == 0
            ? MonthlyCostsValidationError.zero
            : null;
  }
}
