import 'package:flutter/material.dart';

import '../../../dashboard/presentation/views/dashboard.dart';
import 'market_movement.dart';

class MoverCard extends StatelessWidget {
  const MoverCard({
    super.key,
    required this.currency,
    required this.movement,
  });

  final Currency currency;
  final MarketMovement movement;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(.12),
        ),
      ),
      child: InkWell(
        onTap: () {},
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(.12),
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 127,
            maxWidth: 150,
            minWidth: 150,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.square(
                  dimension: 40,
                  child: currency.image,
                ),
                const SizedBox(height: 8),
                Text(currency.longName),
                const SizedBox(height: 8),
                movement,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
