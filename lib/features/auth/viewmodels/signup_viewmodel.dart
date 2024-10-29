import 'package:flutter/material.dart';
import 'package:hackpay/features/auth/domain/dtos/auth_dto.dart';
import 'package:hackpay/features/auth/presentation/views/login.dart';

import '../../../core/app_view_model/app_view_model.dart';
import '../../../core/routing/router.dart';
import '../domain/repositories/auth_repo.dart';

final class SignupViewmodel extends HackyViewModel {
  late final AuthRepo _authRepo;

  final AuthDto _authDto = AuthDto();

  SignupViewmodel(this._authRepo);

  final signupFormKey = GlobalKey<FormState>(debugLabel: 'signupForm');

  void onEmailChanged(String input) {
    _authDto.emailAddress = input;
    setState();
  }

  void onPasswordChanged(String input) {
    _authDto.password = input;
    setState();
  }

  void signup() async {
    if (!signupFormKey.currentState!.validate()) return;
    setState(ViewState.busy);
    final response = await _authRepo.signup(_authDto);

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
      Navigator.restorablePushNamed(
          HackPayRouter.currentContext, LoginView.routeName);
    }
    setState(ViewState.done);
  }
}
