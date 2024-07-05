import 'package:kalshi_finance/app/app.dart';
import 'package:kalshi_finance/bootstrap.dart';
import 'package:wellness_repository/wellness_repository.dart';

void main() async {
  const wellnessRepository = WellnessRepository();

  await bootstrap(
    () => const App(
      wellnessRepository: wellnessRepository,
    ),
  );
}
