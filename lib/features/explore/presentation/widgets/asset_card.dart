import 'package:flutter/material.dart';
import 'package:hackpay/features/dashboard/presentation/views/dashboard.dart';

import '../../../transactions/presentation/views/transactions_view.dart';
import '../../../../shared/mixins.dart';
import 'market_movement.dart';

class AssetCard extends StatelessWidget with MoneyFormat {
  const AssetCard({super.key, this.onTap, required this.currency});

  final void Function()? onTap;
  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () => Navigator.restorablePushNamed(
                context,
                TransactionsView.routeName,
                arguments: currency.shortName,
              ),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 40,
            child: currency.image,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currency.longName),
                Text(currency.shortName),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(currencyFormat().format(24500000)),
              const MarketMovement.up(percentage: 1.76),
            ],
          )
        ],
      ),
    );
  }
}
