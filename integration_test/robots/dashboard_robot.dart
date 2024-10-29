import 'package:flutter_test/flutter_test.dart';

class DashboardRobot {
  final WidgetTester tester;

  DashboardRobot(this.tester);

  Future<void> tapBottomNavItem(String label) async {
    await tester.tap(find.text(label));
    await tester.pumpAndSettle();
  }
}
