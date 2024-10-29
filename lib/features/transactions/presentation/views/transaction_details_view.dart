import 'package:flutter/material.dart';

import '../../../../shared/assets.dart';
import '../../../../shared/back_button.dart';
import '../../../../shared/mixins.dart';
import '../../../../shared/svg_icon.dart';
import '../../domain/dtos/transaction_dto.dart';
import '../widgets/tx_info_card.dart';

class TransactionDetailsView extends StatelessWidget with MoneyFormat {
  const TransactionDetailsView({
    super.key,
    required this.transaction,
  });

  final TransactionDto transaction;

  static const routeName = '/transactions/detail';

  @override
  Widget build(BuildContext context) {
    final metadata = transaction.metadata.entries.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction details'),
        leading: const HackPayBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16)
            .add(const EdgeInsets.only(top: 24)),
        child: Column(
          children: [
            TxDetailsInfo(
              title: 'Hash',
              content: Text(transaction.hash),
            ),
            const Divider(height: 16),
            TxDetailsInfo(
              title: 'Time',
              content: Text(transactionDateFormat.format(transaction.time)),
            ),
            const Divider(height: 16),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => TxDetailsInfo(
                title: metadata.elementAt(index).key,
                content: Text(metadata.elementAt(index).value.toString()),
              ),
              separatorBuilder: (_, __) => const Divider(height: 16),
              itemCount: metadata.length,
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SvgIcon(
                    ImageAssets.externalLink,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  const SizedBox(width: 16),
                  const Expanded(child: Text('View on blockchain explorer')),
                  const SizedBox(width: 16),
                  RotatedBox(
                    quarterTurns: 2,
                    child: SvgIcon(
                      ImageAssets.arrowLeft,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(.32),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
