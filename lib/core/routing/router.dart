import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackpay/features/auth/presentation/views/login.dart';

import '../../features/auth/presentation/views/signup.dart';
import '../../features/dashboard/presentation/views/dashboard.dart';
import '../../features/transactions/domain/dtos/transaction_dto.dart';
import '../../features/transactions/presentation/views/transaction_details_view.dart';
import '../../features/transactions/presentation/views/transactions_view.dart';

class HackPayRouter {
  const HackPayRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get currentContext => navigatorKey.currentState!.context;

  static const initialRoute = LoginView.routeName;

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
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
  }

  static PageRoute<dynamic> getPageRoute(
      {required RouteSettings settings,
      required Widget view,
      bool fullscreenDialog = false}) {
    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoPageRoute(
            settings: settings,
            builder: (_) => view,
            fullscreenDialog: fullscreenDialog)
        : MaterialPageRoute(
            settings: settings,
            builder: (_) => view,
            fullscreenDialog: fullscreenDialog);
  }
}
