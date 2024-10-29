import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../shared/mixins.dart';

class MarketMovement extends StatelessWidget with MoneyFormat {
  const MarketMovement.up({
    super.key,
    required this.percentage,
  }) : positive = true;

  const MarketMovement.down({
    super.key,
    required this.percentage,
  }) : positive = false;

  final bool positive;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    final color = positive ? Colors.green : Colors.red;
    final angle = positive ? -pi / 4 : pi / 4;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: angle,
          child: Icon(
            Icons.arrow_forward,
            color: color,
            size: 16,
          ),
        ),
        Text(
          '${percentageFormat.format(percentage)}%',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
