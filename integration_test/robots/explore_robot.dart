import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hackpay/features/dashboard/presentation/views/dashboard.dart';
import 'package:hackpay/features/explore/presentation/widgets/news_card.dart';
import 'package:hackpay/features/explore/presentation/widgets/widgets.dart';

import 'base_robot.dart';

final class ExploreRobot extends Robot {
  ExploreRobot(super.tester);

  Future<void> tapBalanceVisibilityIcon() async {
    await tester.tap(find.byIcon(Icons.remove_red_eye));
    await tester.pumpAndSettle();
  }

  Future<void> tapAssetCard(Currency currency) async {
    final assetCardFinder = find.descendant(
      matchRoot: true,
      of: find.byType(AssetCard),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is AssetCard &&
            widget.currency.shortName == currency.shortName,
      ),
    );

    await tester.tap(assetCardFinder);
    await tester.pumpAndSettle();
  }

  Future<void> tapMoverCard(Currency currency) async {
    await tester.tap(
      find.descendant(
        matchRoot: true,
        of: find.byType(MoverCard),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is MoverCard &&
              widget.currency.shortName == currency.shortName,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> scrollToWidget(Finder widget,
      {AxisDirection scrollDirection = AxisDirection.down}) async {
    final scrollable = find.byKey(const Key('explore_list_view'));

    final scrollOffset = scrollDirection == AxisDirection.up
        ? const Offset(0, 3000)
        : const Offset(0, -3000);

    await tester.dragUntilVisible(
      widget.first,
      scrollable,
      scrollOffset,
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapNewsCard() async {
    await tester.tap(find.byType(NewsCard).first);
    await tester.pumpAndSettle();
  }
}
