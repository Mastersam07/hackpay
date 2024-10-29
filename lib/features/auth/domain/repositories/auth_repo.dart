import '../../../../core/app_view_model/api_response.dart';
import '../dtos/auth_dto.dart';

abstract interface class AuthRepo {
  Future<ApiResponse<AuthDto>> login(AuthDto dto);

  Future<ApiResponse<AuthDto>> signup(AuthDto dto);
}
