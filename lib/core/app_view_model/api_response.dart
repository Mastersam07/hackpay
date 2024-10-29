import 'failure.dart';

abstract class ApiResponse<T> {
  T? data;
  Failure? error;

  bool get hasError => error != null;
  bool get hasData => data != null;

  ApiResponse(this.data, this.error)
      : assert((data != null) || (error != null),
            'Must have one of data or error');
}
