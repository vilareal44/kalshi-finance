import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:kalshi_finance/home/form_inputs/form_inputs.dart';

part 'wellness_form_state.dart';

class WellnessFormCubit extends Cubit<WellnessFormState> {
  WellnessFormCubit() : super(const WellnessFormState());

  void annualIncomeChanged(int? value) {
    final annualIncome = AnnualIncome.dirty(value);
    emit(
      state.copyWith(annualIncome: annualIncome),
    );
  }

  void monthlyCostsChanged(int? value) {
    final monthlyCosts = MonthlyCosts.dirty(value);
    emit(
      state.copyWith(monthlyCosts: monthlyCosts),
    );
  }
}
