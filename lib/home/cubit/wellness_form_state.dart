part of 'wellness_form_cubit.dart';

class WellnessFormState extends Equatable {
  const WellnessFormState({
    this.annualIncome = const AnnualIncome.pure(),
    this.monthlyCosts = const MonthlyCosts.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  final AnnualIncome annualIncome;
  final MonthlyCosts monthlyCosts;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  bool get isValid => annualIncome.isValid;

  @override
  List<Object?> get props => [annualIncome, monthlyCosts, status, errorMessage];

  WellnessFormState copyWith({
    AnnualIncome? annualIncome,
    MonthlyCosts? monthlyCosts,
    FormzSubmissionStatus? status,
    String? errorMessage,
    bool? valid,
  }) {
    return WellnessFormState(
      annualIncome: annualIncome ?? this.annualIncome,
      monthlyCosts: monthlyCosts ?? this.monthlyCosts,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
