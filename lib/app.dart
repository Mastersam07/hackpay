import 'package:flutter/material.dart';

import 'core/routing/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        restorationScopeId: 'app',
        theme: ThemeData(),
        initialRoute: HackPayRouter.initialRoute,
        onGenerateRoute: HackPayRouter.generateRoutes,
        navigatorKey: HackPayRouter.navigatorKey,
      ),
    );
  }
}
