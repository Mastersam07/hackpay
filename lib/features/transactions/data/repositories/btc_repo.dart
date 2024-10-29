import 'package:flutter/foundation.dart';

import '../../../../core/app_data/api_request.dart';
import '../../../../core/app_data/api_response_impl.dart';
import '../../../../core/app_data/base_repo.dart';
import '../../../../core/app_view_model/api_response.dart';
import '../../../../core/app_view_model/failure.dart';
import '../../domain/dtos/transaction_dto.dart';
import '../../domain/repositories/transaction_repo.dart';
import '../dtos/btc_block_info.dart';

// Helper function to process the response data in an isolate
List<TransactionDto> _transformResponse(dynamic json) {
  final info = BitcoinBlockInfo.fromJson(json);
  return info.tx
      .map((transaction) => TransactionDto(
            hash: transaction.hash,
            time: DateTime.fromMillisecondsSinceEpoch(transaction.time),
            metadata: {
              'Size': transaction.size,
              'Block index': transaction.blockIndex,
              'Height': transaction.blockHeight,
              'Received time':
                  DateTime.fromMillisecondsSinceEpoch(transaction.lockTime)
                      .toString(),
            },
          ))
      .toList();
}

final class BtcTransactionRepo extends BaseRepository
    implements TransactionRepo {
  BtcTransactionRepo(super.apiService, {super.cacheResponseDefault = false});

  static const _baseUrl = 'https://blockchain.info';

  @override
  Future<ApiResponse<List<TransactionDto>?>> fetchRecentTransactions() async {
    // First API call to get the latest block information
    final latestBlockRequest = ApiRequest.get('$_baseUrl/latestblock');

    final latestBlockResponse = await runJsonRequest(
      latestBlockRequest,
      (data, cachedData, err) => BtcBlockInfo.fromJson(data),
    );

    if (latestBlockResponse.hasError) {
      return ApiResponseImpl(error: latestBlockResponse.error!);
    }

    final latestBlockHash = latestBlockResponse.data?.hash;

    if (latestBlockHash == null) {
      return ApiResponseImpl(
          error: InputFailure(message: "Failed to retrieve latest block hash"));
    }

    final rawBlockRequest =
        ApiRequest.get('$_baseUrl/rawblock/$latestBlockHash');

    final rawBlockResponse = await runJsonRequest(
      rawBlockRequest,
      (data, cachedData, err) => data,
    );

    if (rawBlockResponse.hasError) {
      return ApiResponseImpl(error: rawBlockResponse.error!);
    }

    final transactions =
        await compute(_transformResponse, rawBlockResponse.data);

    return ApiResponseImpl(data: transactions);
  }
}
