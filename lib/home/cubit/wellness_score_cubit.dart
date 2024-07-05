import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_repository/wellness_repository.dart';

class WellnessScoreCubit extends Cubit<WellnessScore> {
  WellnessScoreCubit({required WellnessRepository wellnessRepository})
      : _wellnessRepository = wellnessRepository,
        super(WellnessScore.healthy);

  final WellnessRepository _wellnessRepository;

  void calculateWellnessScore({
    required int? annualIncome,
    required int? monthlyCosts,
  }) {
    if (annualIncome == null || monthlyCosts == null) {
      emit(WellnessScore.unknown);
      return;
    }

    final score = _wellnessRepository.calculateScore(
      annualGrossIncome: annualIncome,
      monthlyCosts: monthlyCosts,
    );

    emit(score);
  }
}
