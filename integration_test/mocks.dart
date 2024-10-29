import 'package:hackpay/core/app_data/api_request.dart';
import 'package:hackpay/core/app_data/api_response_impl.dart';
import 'package:hackpay/core/app_view_model/api_response.dart';
import 'package:hackpay/core/app_view_model/failure.dart';
import 'package:hackpay/core/network/network_api_service.dart';
import 'package:hackpay/features/auth/domain/dtos/auth_dto.dart';
import 'package:hackpay/features/auth/domain/repositories/auth_repo.dart';

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

class MockDioNetworkService extends NetworkApiService {
  @override
  Future<Map<String, dynamic>> sendJson<T>(
      {required ApiRequest request}) async {
    // Simulate responses for specific endpoints
    if (request.endpoint.contains('latestblock')) {
      // Mock response for the latest block information
      return {
        'hash':
            '0000000000000000000c6bc14c0d000f20b0e2fa6b9f8a5e75e5d0fefb4a6c1b',
      };
    } else if (request.endpoint.contains('rawblock')) {
      // Mock response for the raw block transaction data
      return {
        'tx': List.generate(30, (index) {
          return {
            'hash': 'btc_tx_hash_$index',
            'time': DateTime.now().millisecondsSinceEpoch ~/ 1000,
            'metadata': {
              'amount': (index + 1) * 1000,
              'currency': 'BTC',
            },
          };
        })
      };
    } else if (request.endpoint.contains('v1/blocks')) {
      // Mock response for Tezos block transactions
      return {
        'transactions': List.generate(30, (index) {
          return {
            'hash': 'tz_tx_hash_$index',
            'timestamp': DateTime.now().toIso8601String(),
            'level': index,
            'metadata': {
              'reward': 50.0,
              'bonus': 10.0,
              'fees': 0.5,
            }
          };
        }),
        'reward': 50.0,
        'bonus': 10.0,
        'fees': 0.5,
      };
    } else {
      throw Exception('Unknown endpoint');
    }
  }
}
