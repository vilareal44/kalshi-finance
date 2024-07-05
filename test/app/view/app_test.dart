import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_finance/app/app.dart';
import 'package:kalshi_finance/home/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
