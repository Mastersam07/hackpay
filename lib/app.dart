import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.interTextTheme().copyWith(
            titleMedium: const TextStyle(fontSize: 20),
            bodyLarge: const TextStyle(fontSize: 16),
            bodyMedium: const TextStyle(fontSize: 14),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(12),
            fillColor: const Color(0xffefefef),
            labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Color(0xFF5A5A5A),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            hintStyle: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 16,
                color: const Color(0xFF000000).withOpacity(0.32),
              ),
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
            onSurface: Colors.black,
            seedColor: const Color(0xFF12A633),
            primary: const Color(0xFF12A633),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF12A633),
              minimumSize: const Size.fromHeight(48),
              textStyle: const TextStyle(fontSize: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ),
        initialRoute: HackPayRouter.initialRoute,
        onGenerateRoute: HackPayRouter.generateRoutes,
        navigatorKey: HackPayRouter.navigatorKey,
      ),
    );
  }
}
