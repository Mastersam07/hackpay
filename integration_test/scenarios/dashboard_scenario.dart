import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hackpay/features/dashboard/presentation/views/connect.dart';
import 'package:hackpay/features/dashboard/presentation/views/earnings.dart';
import 'package:hackpay/features/dashboard/presentation/views/portfolio.dart';
import 'package:hackpay/features/dashboard/presentation/views/spend.dart';
import 'package:hackpay/features/explore/presentation/views/home.dart';

import '../common.dart';
import '../robots/auth_robot.dart';
import '../robots/dashboard_robot.dart';

void main() {
  testWidgets('Dashboard scenario test', (WidgetTester tester) async {
    final authRobot = AuthRobot(tester);
    final dashboardRobot = DashboardRobot(tester);

    await createApp(tester);
    await authRobot.enterEmail('abadasosp@gmail.com');
    await authRobot.enterPassword('abada');
    await authRobot.tapContinueButton();

    // Verify the Explore page is displayed initially
    await tester.pumpAndSettle();
    expect(find.byType(ExploreView), findsOneWidget);

    // Tap on the Portfolio tab and verify the Portfolio page is displayed
    await dashboardRobot.tapBottomNavItem('Portfolio');
    expect(find.byType(PortfolioView), findsOneWidget);

    // Tap on the Earn tab and verify the Earn page is displayed
    await dashboardRobot.tapBottomNavItem('Earn');
    expect(find.byType(EarningsView), findsOneWidget);

    // Tap on the Spend tab and verify the Spend page is displayed
    await dashboardRobot.tapBottomNavItem('Spend');
    expect(find.byType(SpendView), findsOneWidget);

    // Tap on the Connect tab and verify the Connect page is displayed
    await dashboardRobot.tapBottomNavItem('Connect');
    expect(find.byType(ConnectView), findsOneWidget);

    // Tap back to the Explore tab and verify the Explore page is displayed
    await dashboardRobot.tapBottomNavItem('Explore');
    expect(find.byType(ExploreView), findsOneWidget);
  });

  tearDown(GetIt.instance.reset);
}
