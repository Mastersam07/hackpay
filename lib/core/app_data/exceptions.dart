import 'dart:async';

import '../app_view_model/failure.dart';

abstract class AppException {
  Failure toFailure();
}

extension AppExceptionExtension on TimeoutException {
  TimeoutFailure toFailure() => TimeoutFailure();
}

class ServerException implements AppException {
  final String? errorMessage;
  ServerException({this.errorMessage});
  @override
  ServerFailure toFailure() => ServerFailure(message: errorMessage);
}

class InputException implements AppException {
  final String errorMessage;
  InputException({required this.errorMessage});
  @override
  InputFailure toFailure() => InputFailure(message: errorMessage);
}

class UnauthorisedException implements Exception {
  final String errorMessage;
  UnauthorisedException({this.errorMessage = ''});
  BadAuthFailure toFailure() => BadAuthFailure(message: errorMessage);
}

class NetworkException implements AppException {
  @override
  Failure toFailure() => NetworkFailure();
}

class UnknownException implements AppException {
  @override
  Failure toFailure() => UnknownFailure();
}
