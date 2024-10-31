import 'package:flutter/material.dart';
import 'package:hackpay/core/locator.dart';
import 'package:hackpay/features/auth/presentation/viewmodels/login_viewmodel.dart';

import '../../../../shared/back_button.dart';
import '../../../../shared/mixins.dart';
import '../widgets/pay_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = '/auth/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with UiUtils {
  late LoginViewmodel loginVm;

  final emailAddress = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginVm = AppDependencies.locate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const HackPayBackButton(),
      ),
      body: ListenableBuilder(
          listenable: loginVm,
          builder: (context, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SafeArea(
                child: Form(
                  key: loginVm.loginFormKey,
                  child: AutofillGroup(
                    child: FocusTraversalGroup(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Log in to your account',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color(0xFF000000).withOpacity(.95),
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Welcome back! Please enter your registered email address to continue',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(.6),
                                    ),
                          ),
                          const SizedBox(height: 24),
                          PayTextField(
                            key: const Key('emailField'),
                            title: 'Email address',
                            hint: 'Enter email',
                            controller: emailAddress,
                            onChanged: loginVm.onEmailChanged,
                            autofillHints: const [
                              AutofillHints.username,
                              AutofillHints.email
                            ],
                            validator: (String? val) {
                              if (val == null || val.isEmpty) {
                                return 'Email cannot be empty';
                              }
                              if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(val)) {
                                return 'Enter valid email!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          PayTextField.password(
                            key: const Key('passwordField'),
                            title: 'Password',
                            hint: 'Enter password',
                            controller: password,
                            onChanged: loginVm.onPasswordChanged,
                            autofillHints: const [AutofillHints.password],
                            validator: (String? val) {
                              if (val == null || val.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              return null;
                            },
                          ),
                          const Spacer(),
                          FilledButton(
                            onPressed: () {
                              unfocus();
                              loginVm.login();
                            },
                            style: FilledButton.styleFrom(
                                foregroundBuilder: (context, states, child) {
                              if (loginVm.isBusy) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator.adaptive(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.surface,
                                      valueColor: AlwaysStoppedAnimation(
                                          Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    const SizedBox(width: 4),
                                    child!,
                                  ],
                                );
                              }
                              return child!;
                            }),
                            child: const Text('Continue'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
