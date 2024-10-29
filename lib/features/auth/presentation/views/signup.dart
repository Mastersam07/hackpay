import 'package:flutter/material.dart';
import 'package:hackpay/features/auth/viewmodels/signup_viewmodel.dart';

import '../../../../core/locator.dart';
import '../widgets/pay_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  static const routeName = '/auth';

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late SignupViewmodel signupVm;

  final emailAddress = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    signupVm = AppDependencies.locate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: ListenableBuilder(
          listenable: signupVm,
          builder: (context, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SafeArea(
                child: Form(
                  key: signupVm.signupFormKey,
                  child: AutofillGroup(
                    child: FocusTraversalGroup(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Sign up',
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Please signup to continue',
                          ),
                          const SizedBox(height: 24),
                          PayTextField(
                            title: 'Email address',
                            hint: 'Enter email',
                            controller: emailAddress,
                            onChanged: signupVm.onEmailChanged,
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
                            title: 'Password',
                            hint: 'Enter password',
                            controller: password,
                            onChanged: signupVm.onPasswordChanged,
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
                            onPressed: () => signupVm.signup(context),
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
