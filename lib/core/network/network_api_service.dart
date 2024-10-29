import '../app_data/api_request.dart';

typedef Json = Map<String, dynamic>;

abstract class NetworkApiService {
  Future<Map<String, dynamic>> sendJson<T>({required ApiRequest request});

  Future<Map<String, dynamic>> sendFormData<T>({required ApiRequest request});
}
