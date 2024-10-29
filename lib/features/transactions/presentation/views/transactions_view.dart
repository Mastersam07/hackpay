import 'package:flutter/material.dart';
import 'package:hackpay/core/locator.dart';
import 'package:hackpay/features/transactions/viewmodels/transaction_viewmodel.dart';
import 'package:hackpay/shared/back_button.dart';
import 'package:hackpay/shared/mixins.dart';
import 'package:hackpay/features/dashboard/presentation/views/dashboard.dart';
import 'package:hackpay/features/transactions/presentation/views/transaction_details_view.dart';

import '../../../../shared/hackpay_overlay.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key, required this.currency});

  final Currency currency;

  static const routeName = '/transactions';

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> with MoneyFormat {
  late TransactionViewmodel transactionVm = AppDependencies.locate();
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      transactionVm.setCurrency(widget.currency);
      transactionVm.fetchTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: transactionVm,
        builder: (context, _) {
          return LoadingOverlay(
            isLoading: transactionVm.isBusy,
            color: Colors.white,
            opacity: 1,
            progressIndicator: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  strokeWidth: 4,
                ),
                const SizedBox(height: 40),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodySmall!,
                  child: Text(
                    'Fetching your {${widget.currency.name.toUpperCase()}} transactions',
                  ),
                ),
              ],
            ),
            child: Scaffold(
              appBar: AppBar(
                leading: const HackPayBackButton(),
                title: Text(
                    "${widget.currency.shortName.toUpperCase()} transactions"),
              ),
              body: SafeArea(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(top: 24),
                  itemCount: transactionVm.transactions.length,
                  separatorBuilder: (_, __) => const Divider(height: 32),
                  itemBuilder: (context, index) {
                    final transactionItem =
                        transactionVm.transactions.elementAt(index);
                    return InkWell(
                      key: Key('transaction_$index'),
                      onTap: () => Navigator.pushNamed(
                          context, TransactionDetailsView.routeName,
                          arguments: transactionItem),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(transactionItem.hash,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                const SizedBox(height: 8),
                                Text(
                                  transactionDateFormat
                                      .format(transactionItem.time),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.chevron_right)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
