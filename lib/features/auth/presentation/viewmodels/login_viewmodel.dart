import 'package:flutter/material.dart';
import 'package:hackpay/core/app_view_model/app_view_model.dart';
import 'package:hackpay/core/routing/router.dart';

import '../../../dashboard/presentation/views/dashboard.dart';
import '../../domain/dtos/auth_dto.dart';
import '../../domain/repositories/auth_repo.dart';

final class LoginViewmodel extends HackyViewModel {
  late final AuthRepo _authRepo;

  final AuthDto _authDto = AuthDto();

  LoginViewmodel(this._authRepo);

  final loginFormKey = GlobalKey<FormState>(debugLabel: 'loginForm');

  void onEmailChanged(String input) {
    _authDto.emailAddress = input;
    setState();
  }

  void onPasswordChanged(String input) {
    _authDto.password = input;
    setState();
  }

  void login() async {
    if (!loginFormKey.currentState!.validate()) return;
    setState(ViewState.busy);
    final response = await _authRepo.login(_authDto);

    if (response.hasError && HackPayRouter.currentContext.mounted) {
      ScaffoldMessenger.of(HackPayRouter.currentContext).showSnackBar(
        SnackBar(
          content: Text(response.error!.message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
      setState(ViewState.error);
      return;
    }
    if (HackPayRouter.currentContext.mounted) {
      Navigator.restorablePushNamedAndRemoveUntil(
          HackPayRouter.currentContext, DashboardView.routeName, (_) => false);
    }
    setState(ViewState.done);
  }
}
