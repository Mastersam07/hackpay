import 'package:flutter_test/flutter_test.dart';
import 'package:hackpay/features/auth/presentation/views/login.dart';
import 'package:hackpay/features/auth/presentation/views/signup.dart';
import 'package:hackpay/features/dashboard/presentation/views/dashboard.dart';

import '../common.dart';
import '../robots/auth_robot.dart';

void main() {
  testWidgets('User signs up and logs in scenario',
      (WidgetTester tester) async {
    final robot = AuthRobot(tester);

    await createApp(tester);

    expect(find.byType(LoginView), findsOneWidget);

    await robot.tapContinueButton();

    expect(find.text('Email cannot be empty'), findsOneWidget);
    expect(find.text('Password cannot be empty'), findsOneWidget);

    await robot.tapBackButton();

    expect(find.byType(SignupView), findsOneWidget);

    await robot.enterEmail('abadasosp@gmail.com');
    await robot.enterPassword('abada');
    await robot.tapContinueButton();

    expect(find.byType(LoginView), findsOneWidget);

    await robot.enterEmail('abadasamuelosp@gmail.com');
    await robot.enterPassword('abada');
    await robot.tapContinueButton();

    await tester.pumpAndSettle();
    robot.expectErrorMessage('User does not exist!');

    await robot.enterEmail('abadasosp@gmail.com');
    await robot.enterPassword('abada');
    await robot.tapContinueButton();

    await tester.pumpAndSettle();
    expect(find.byType(DashboardView), findsOneWidget);
  });
}
