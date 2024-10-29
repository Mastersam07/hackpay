import '../app_view_model/api_response.dart';
import '../app_view_model/failure.dart';

class ApiResponseImpl<E> extends ApiResponse<E> {
  ApiResponseImpl({E? data, Failure? error, bool? userDefined})
      : super(data, error);
}
