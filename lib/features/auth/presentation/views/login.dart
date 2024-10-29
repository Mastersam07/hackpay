import 'package:flutter/material.dart';
import 'package:hackpay/core/locator.dart';
import 'package:hackpay/features/auth/viewmodels/login_viewmodel.dart';

import '../widgets/pay_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = '/auth/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
        leading: IconButton(
          key: const Key('backButton'),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
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
                          const Text(
                            'Log in to your account',
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Welcome back! Please enter your registered email address to continue',
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
                          PayTextField(
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
                          OutlinedButton(
                            onPressed: loginVm.login,
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
