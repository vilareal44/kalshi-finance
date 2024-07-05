import 'package:wellness_repository/src/models/wellness_score.dart';

/// {@template score_repository}
/// Kalshi wellness repository
/// {@endtemplate}
class WellnessRepository {
  /// {@macro score_repository}
  const WellnessRepository();

  /// Gets the financial score
  /// Returns  [WellnessScore]
  WellnessScore calculateScore({
    required double annualGrossIncome,
    required double monthlyCosts,
  }) {
    final annualNetIncome = annualGrossIncome - (annualGrossIncome * 0.08);
    final annualCosts = monthlyCosts * 12;
    final costsProportion = (annualCosts / annualNetIncome) * 100;

    return costsProportion <= 25
        ? WellnessScore.healthy
        : costsProportion <= 75
            ? WellnessScore.medium
            : WellnessScore.low;
  }
}
