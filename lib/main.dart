import 'package:flutter/material.dart';
import 'package:hackpay/core/locator.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDependencies.i.register();
  runApp(const MyApp());
}
