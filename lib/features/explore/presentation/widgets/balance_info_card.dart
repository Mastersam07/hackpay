import 'package:flutter/material.dart';
import 'package:hackpay/shared/mixins.dart';

class BalanceInfoCard extends StatefulWidget {
  const BalanceInfoCard({
    super.key,
    required this.balance,
  });

  final num balance;

  @override
  State<BalanceInfoCard> createState() => _BalanceInfoCardState();
}

class _BalanceInfoCardState extends State<BalanceInfoCard> with MoneyFormat {
  bool amountVisible = true;

  void _toggleAmtVisibility() {
    setState(() {
      amountVisible = !amountVisible;
    });
  }

  List<String> splitMoney(String amount) {
    if (amount.contains('.')) {
      final parts = amount.split('.');
      return [parts[0], parts[1].padRight(2, '0')];
    } else {
      return [amount, '00'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final amountParts = splitMoney(widget.balance.toStringAsFixed(2));
    final largerFraction = int.tryParse(amountParts[0]) ?? 0;
    final smallerFraction = int.tryParse(amountParts[1]) ?? 0;

    final child = amountVisible
        ? Text.rich(
            TextSpan(
              text: '₦',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
              children: [
                TextSpan(
                  text: currencyFormat(symbol: '').format(largerFraction),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
                TextSpan(
                  text: ".${smallerFraction.toString().padLeft(2, '0')}",
                ),
              ],
            ),
          )
        : Text(
            '****',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface),
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'My balance',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color:
                        Theme.of(context).colorScheme.onSurface.withOpacity(.6),
                  ),
            ),
            const SizedBox(width: 4),
            InkWell(
              key: const Key('balanceVisibility'),
              onTap: _toggleAmtVisibility,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: amountVisible
                      ? Icon(Icons.visibility_off,
                          key: const Key('visible'),
                          size: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6))
                      : Icon(Icons.visibility,
                          key: const Key('hidden'),
                          size: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6)),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
