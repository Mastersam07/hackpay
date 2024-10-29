import 'package:flutter/foundation.dart';

import '../../../../core/app_data/api_request.dart';
import '../../../../core/app_data/api_response_impl.dart';
import '../../../../core/app_data/base_repo.dart';
import '../../../../core/app_view_model/api_response.dart';
import '../../domain/dtos/transaction_dto.dart';
import '../../domain/repositories/transaction_repo.dart';
import '../dtos/tz_block_info.dart';

List<TransactionDto> _transformTezosResponse(dynamic json) {
  final info = TezosBlockInfo.fromJson(json);
  return info.transactions
      .map((transaction) => TransactionDto(
            hash: transaction.hash,
            time: DateTime.parse(transaction.timestamp),
            metadata: {
              'Level': transaction.level.toString(),
              'Reward': info.reward,
              'Bonus': info.bonus,
              'Fees': info.fees,
            },
          ))
      .toList();
}

final class TezosTransactionRepo extends BaseRepository
    implements TransactionRepo {
  TezosTransactionRepo(super.apiService, {super.cacheResponseDefault = false});

  static const _baseUrl = 'https://api.tzkt.io';

  @override
  Future<ApiResponse<List<TransactionDto>?>> fetchRecentTransactions() async {
    final requestUrl =
        '$_baseUrl/v1/blocks/${DateTime.now().toIso8601String()}';

    final latestBlockRequest = ApiRequest.get(requestUrl);

    final latestBlockResponse = await runJsonRequest(
      latestBlockRequest,
      (data, cachedData, err) => data,
    );

    if (latestBlockResponse.hasError) {
      return ApiResponseImpl(error: latestBlockResponse.error!);
    }

    final transactions =
        await compute(_transformTezosResponse, latestBlockResponse.data);

    return ApiResponseImpl(data: transactions);
  }
}
