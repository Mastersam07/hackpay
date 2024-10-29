import '../../../../core/app_view_model/api_response.dart';
import '../dtos/transaction_dto.dart';

abstract interface class TransactionRepo {
  Future<ApiResponse<List<TransactionDto>?>> fetchRecentTransactions();
}
