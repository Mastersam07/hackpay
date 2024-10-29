import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/auth/presentation/views/signup.dart';
import 'features/dashboard/presentation/views/dashboard.dart';
import 'features/auth/presentation/views/login.dart';
import 'features/transactions/domain/dtos/transaction_dto.dart';
import 'features/transactions/presentation/views/transaction_details_view.dart';
import 'features/transactions/presentation/views/transactions_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        restorationScopeId: 'app',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(),
        initialRoute: LoginView.routeName,
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              switch (routeSettings.name) {
                case DashboardView.routeName:
                  return const DashboardView();
                case LoginView.routeName:
                  return const LoginView();
                case SignupView.routeName:
                  return const SignupView();
                case TransactionsView.routeName:
                  return switch (routeSettings.arguments) {
                    String currency =>
                      TransactionsView(currency: Currency.fromString(currency)),
                    _ => throw ArgumentError(
                        'Invalid currency ${routeSettings.arguments} for ${routeSettings.name} route'),
                  };
                case TransactionDetailsView.routeName:
                  return switch (routeSettings.arguments) {
                    TransactionDto transaction =>
                      TransactionDetailsView(transaction: transaction),
                    _ => throw ArgumentError(
                        'Invalid ${routeSettings.arguments} for ${routeSettings.name} route'),
                  };
                default:
                  return const Scaffold(
                    body: Center(
                      child: Text('404. Invalid route'),
                    ),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
