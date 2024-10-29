import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_robot.dart';

final class TransactionsRobot extends Robot {
  TransactionsRobot(super.tester);

  // Scroll to and tap a specific transaction tile by index
  Future<void> tapTransactionTile(int index) async {
    // Ensure the transaction tile exists
    final transactionFinder = find.byType(ListView).first;

    await tester.dragUntilVisible(
      find.byKey(Key('transaction_$index')),
      transactionFinder,
      const Offset(0, -300),
    );

    // Tap the transaction tile
    await tester.tap(find.byKey(Key('transaction_$index')));
    await tester.pumpAndSettle();
  }
}
