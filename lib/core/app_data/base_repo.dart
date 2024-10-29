import 'dart:async';

import '../app_view_model/failure.dart';
import '../network/network_api_service.dart';
import 'api_request.dart';
import 'api_response_impl.dart';
import 'exceptions.dart';

typedef Result<T> = Future<ApiResponseImpl<T>>;

abstract class BaseRepository {
  final NetworkApiService apiService;
  final bool cacheResponseDefault;
  BaseRepository(this.apiService, {required this.cacheResponseDefault});

  Failure convertException(e) {
    if (e is AppException) {
      return e.toFailure();
    } else if (e is TimeoutException) {
      return TimeoutFailure();
    } else {
      return UnknownFailure();
    }
  }

  Result<T> runJsonRequest<T>(ApiRequest req,
      T Function(Json data, bool cachedData, Object? err) transformer,
      {bool? cacheThis}) async {
    try {
      final x = await apiService.sendJson(request: req);
      if (cacheThis ?? cacheResponseDefault) cacheReq(req, x);
      return ApiResponseImpl(data: transformer(x, false, null));
    } catch (e) {
      final cachedData = await fetchCache(req);
      return ApiResponseImpl(
        data: (cachedData != null) ? transformer(cachedData, true, e) : null,
        error: convertException(e),
      );
    }
  }

  final Map<ApiRequest, Map<String, dynamic>> _cache = {};

  void cacheReq(ApiRequest req, Map<String, dynamic> response) {
    _cache[req] = response;
  }

  void clearCache() => _cache.clear();
  Future<Map<String, dynamic>?> fetchCache(ApiRequest req) =>
      Future.value(_cache[req]);
  bool removeCache(ApiRequest req) {
    if (_cache[req] != null) {
      _cache.remove(req);
      return true;
    } else {
      return false;
    }
  }
}
