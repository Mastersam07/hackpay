import 'package:flutter_test/flutter_test.dart';

import 'scenarios/auth_scenario.dart' as auth_test;

void main() {
  group('Hackpay Tests', () {
    auth_test.main();
  });
}
