import 'package:hackpay/core/app_data/api_response_impl.dart';
import 'package:hackpay/core/app_view_model/api_response.dart';
import 'package:hackpay/core/app_view_model/failure.dart';
import 'package:hackpay/features/auth/domain/dtos/auth_dto.dart';
import 'package:hackpay/features/auth/domain/repositories/auth_repo.dart';
import 'package:hackpay/features/transactions/domain/repositories/transaction_repo.dart';
import 'package:mocktail/mocktail.dart';

const _kNetworkDelay = Duration(seconds: 2);

class MockAuthRepo implements AuthRepo {
  @override
  Future<ApiResponse<AuthDto>> login(AuthDto dto) async {
    await Future.delayed(_kNetworkDelay);
    if (dto.emailAddress == 'abadasosp@gmail.com') {
      if (dto.password == 'abada') {
        return ApiResponseImpl(data: dto);
      }

      if (dto.password != 'abada') {
        return ApiResponseImpl(
            error: ServerFailure(message: 'Incorrect password'));
      }
    }

    return ApiResponseImpl(
        error: ServerFailure(message: 'User does not exist!'));
  }

  @override
  Future<ApiResponse<AuthDto>> signup(AuthDto dto) async {
    if (dto.emailAddress == 'abadasamuelosp@gmail.com') {
      return ApiResponseImpl(
          error: ServerFailure(message: 'User already exists'));
    }
    return ApiResponseImpl(data: dto);
  }
}

class MockBtcTransactionRepo extends Mock implements TransactionRepo {}

class MockTezosTransactionRepo extends Mock implements TransactionRepo {}
