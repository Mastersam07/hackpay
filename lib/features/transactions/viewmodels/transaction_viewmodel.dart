import 'package:hackpay/core/locator.dart';
import 'package:hackpay/features/dashboard/presentation/views/dashboard.dart';

import '../../../core/app_view_model/app_view_model.dart';
import '../data/repositories/btc_repo.dart';
import '../data/repositories/tezos_repo.dart';
import '../domain/dtos/transaction_dto.dart';
import '../domain/repositories/transaction_repo.dart';

final class TransactionViewmodel extends HackyViewModel {
  late TransactionRepo _repo;

  List<TransactionDto> _transactions = [];
  List<TransactionDto> get transactions => List.from(_transactions);

  void setCurrency(Currency currency) {
    _repo = switch (currency) {
      Currency.btc => BtcTransactionRepo(AppDependencies.locate()),
      Currency.tz => TezosTransactionRepo(AppDependencies.locate()),
      _ => throw UnimplementedError('Asset ${currency.name} not supported'),
    };
  }

  fetchTransactions() async {
    setState(ViewState.busy);
    final response = await _repo.fetchRecentTransactions();
    if (response.hasError) {
      setState(ViewState.error);
      return;
    }
    _transactions = response.data ?? [];
    setState(ViewState.done);
  }
}
