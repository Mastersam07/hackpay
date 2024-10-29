import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hackpay/features/dashboard/presentation/views/dashboard.dart';
import 'package:hackpay/features/explore/presentation/views/home.dart';
import 'package:hackpay/features/explore/presentation/widgets/news_card.dart';
import 'package:hackpay/features/explore/presentation/widgets/widgets.dart';
import 'package:hackpay/features/transactions/presentation/views/transaction_details_view.dart';
import 'package:hackpay/features/transactions/presentation/views/transactions_view.dart';

import '../common.dart';
import '../robots/auth_robot.dart';
import '../robots/explore_robot.dart';
import '../robots/transactions_robot.dart';

void main() {
  testWidgets('Explore page scenario test', (WidgetTester tester) async {
    final authRobot = AuthRobot(tester);
    final exploreRobot = ExploreRobot(tester);
    final transactionsRobot = TransactionsRobot(tester);

    await createApp(tester);
    await authRobot.enterEmail('abadasosp@gmail.com');
    await authRobot.enterPassword('abada');
    await authRobot.tapContinueButton();

    // Verify the Explore page is displayed
    await tester.pumpAndSettle();
    expect(find.byType(ExploreView), findsOneWidget);

    // Tap the visibility icon to toggle balance visibility
    await exploreRobot.tapBalanceVisibilityIcon();

    await exploreRobot.scrollToWidget(find.byType(AssetCard),
        scrollDirection: AxisDirection.up);
    await exploreRobot.tapAssetCard(Currency.btc);

    expect(find.byType(TransactionsView), findsOneWidget);

    await transactionsRobot.tapTransactionTile(Random().nextInt(20));

    expect(find.byType(TransactionDetailsView), findsOneWidget);

    await transactionsRobot.tapBackButton();
    await transactionsRobot.tapBackButton();

    expect(find.byType(ExploreView), findsOneWidget);

    // Scroll to and tap a MoverCard (horizontal scrolling)
    await exploreRobot.scrollToWidget(find.byType(MoverCard),
        scrollDirection: AxisDirection.down);
    await exploreRobot.tapMoverCard(Currency.eth);

    // TODO: Navigate back to Explore page
    // TODO: If MoverCard routes to a new view
    // await exploreRobot.tapBackButton();

    // Scroll to the first news tile and tap
    await exploreRobot.scrollToWidget(find.byType(NewsCard),
        scrollDirection: AxisDirection.down);
    await exploreRobot.tapNewsCard();

    // TODO: Navigate back to Explore page
    // TODO: If NewsCard routes to a new view
    // await exploreRobot.tapBackButton();

    await exploreRobot.scrollToTop();
    await exploreRobot.tapAssetCard(Currency.tz);

    expect(find.byType(TransactionsView), findsOneWidget);

    await transactionsRobot.tapTransactionTile(Random().nextInt(20));

    expect(find.byType(TransactionDetailsView), findsOneWidget);

    await transactionsRobot.tapBackButton();
    await transactionsRobot.tapBackButton();

    expect(find.byType(ExploreView), findsOneWidget);
  });

  tearDown(GetIt.instance.reset);
}
