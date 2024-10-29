import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_robot.dart';

final class AuthRobot extends Robot {
  const AuthRobot(super.tester);

  // Method to enter email
  Future<void> enterEmail(String email) async {
    final Finder emailField = find.byKey(const Key('emailField'));
    await tester.enterText(emailField, email);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 800));
  }

  // Method to enter password
  Future<void> enterPassword(String password) async {
    final Finder passwordField = find.byKey(const Key('passwordField'));
    await tester.enterText(passwordField, password);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 800));
  }

  // Method to tap on the continue button
  Future<void> tapContinueButton() async {
    final Finder loginButton = find.text('Continue');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 800));
  }

  // Method to check for error messages
  Future<void> expectErrorMessage(String message) async {
    final Finder errorMessageFinder = find.text(message);
    expect(errorMessageFinder, findsOneWidget);
  }
}
