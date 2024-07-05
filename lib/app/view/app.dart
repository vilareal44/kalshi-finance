import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi_finance/home/home.dart';
import 'package:kalshi_finance/l10n/l10n.dart';
import 'package:wellness_repository/wellness_repository.dart';

class App extends StatelessWidget {
  const App({
    required WellnessRepository wellnessRepository,
    super.key,
  }) : _wellnessRepository = wellnessRepository;

  final WellnessRepository _wellnessRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _wellnessRepository),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/home',
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/wellness-score',
          builder: (BuildContext context, GoRouterState state) {
            final extraValues = state.extra as Map<String, dynamic>?;
            return ScorePage(
              annualIncome: extraValues?['annualIncome'] as int?,
              monthlyCosts: extraValues?['monthlyCosts'] as int?,
            );
          },
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
