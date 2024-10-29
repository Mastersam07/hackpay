import 'package:flutter_test/flutter_test.dart';

import 'scenarios/auth_scenario.dart' as auth_test;
import 'scenarios/dashboard_scenario.dart' as dashboard_test;
import 'scenarios/explore_scenario.dart' as explore_test;

void main() {
  group('Hackpay Tests', () {
    auth_test.main();
    dashboard_test.main();
    explore_test.main();
  });
}
