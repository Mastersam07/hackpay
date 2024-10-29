abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure implements Failure {
  @override
  final String message;
  ServerFailure({String? message}) : message = message ?? 'Error occured';
}

class InputFailure implements Failure {
  @override
  final String message;
  InputFailure({required this.message});
}

class BadAuthFailure implements Failure {
  @override
  final String message;
  BadAuthFailure({required this.message});
}

class NetworkFailure implements Failure {
  @override
  String get message => 'Please check your internet connection';
}

class TimeoutFailure implements Failure {
  @override
  final String message;

  TimeoutFailure({this.message = 'Request Timed out. Try again'});
}

class UnknownFailure implements Failure {
  @override
  String get message => 'Something went wrong. Try again';
}
