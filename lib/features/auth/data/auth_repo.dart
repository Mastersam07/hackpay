import 'dart:convert';

import 'package:hackpay/features/auth/domain/dtos/auth_dto.dart';
import 'package:hackpay/core/app_data/__app_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

import '../../../core/app_view_model/api_response.dart';
import '../../../core/app_view_model/failure.dart';
import '../domain/repositories/auth_repo.dart';

final class AuthRepoImpl implements AuthRepo {
  late SharedPreferencesAsync _store = SharedPreferencesAsync();

  AuthRepoImpl({SharedPreferencesAsync? store}) {
    _store = store ?? _store;
  }

  List<AuthDto> _users = [];

  Future<List<AuthDto>> _fetchUsers() async {
    final String dataStore = await _store.getString('signed_up_users') ?? '';
    if (dataStore.isEmpty) return [];

    if (_users.isNotEmpty) return _users;
    final listResult = await jsonDecode(dataStore);
    _users = switch (listResult) {
      List list => list.map((e) => AuthDto.fromJson(e)).toList(),
      _ => [],
    };

    return _users;
  }

  Future<void> _saveUser(AuthDto user) async {
    final existingUsers = await _fetchUsers();
    existingUsers.add(user);
    await _store.setString('signed_up_users', jsonEncode(existingUsers));
  }

  @override
  Future<ApiResponse<AuthDto>> login(AuthDto dto) async {
    final existingUsers = await _fetchUsers();
    final userQuery = existingUsers.firstWhereOrNull(
        (element) => element.emailAddress == dto.emailAddress);

    if (userQuery == null) {
      return ApiResponseImpl(
          error: ServerFailure(message: 'User does not exist!'));
    }

    if (userQuery.password != dto.password) {
      return ApiResponseImpl(
          error: ServerFailure(message: 'Incorrect password'));
    }

    return ApiResponseImpl(data: userQuery);
  }

  @override
  Future<ApiResponse<AuthDto>> signup(AuthDto dto) async {
    final existingUsers = await _fetchUsers();
    final userQuery = existingUsers.firstWhereOrNull(
        (element) => element.emailAddress == dto.emailAddress);

    if (userQuery != null) {
      return ApiResponseImpl(
          error: ServerFailure(message: 'User already exists'));
    }

    await _saveUser(dto);
    return ApiResponseImpl(data: dto);
  }
}
