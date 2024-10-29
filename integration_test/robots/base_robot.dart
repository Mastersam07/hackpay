import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

abstract base class Robot {
  final WidgetTester tester;

  const Robot(this.tester);

  Future<void> tapBackButton() async {
    final Finder backButton = find.byKey(const Key('backButton'));
    await tester.tap(backButton);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 800));
  }
}
