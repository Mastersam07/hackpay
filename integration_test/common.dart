import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hackpay/app.dart';
import 'package:hackpay/features/auth/domain/repositories/auth_repo.dart';
import 'package:hackpay/features/auth/viewmodels/login_viewmodel.dart';
import 'package:hackpay/features/auth/viewmodels/signup_viewmodel.dart';
import 'package:hackpay/features/transactions/viewmodels/transaction_viewmodel.dart';

import 'mocks.dart';

const kDelayDuration = Duration(milliseconds: 800);

Future<void> createApp(WidgetTester tester) async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance
    ..registerFactory<AuthRepo>(() => MockAuthRepo())
    ..registerFactory(() => LoginViewmodel(GetIt.instance()))
    ..registerFactory(() => SignupViewmodel(GetIt.instance()))
    ..registerLazySingleton(() => TransactionViewmodel());

  if (defaultTargetPlatform == TargetPlatform.android) {
    const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );

  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}
