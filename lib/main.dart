import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const LogBApp());
}

class LogBApp extends StatelessWidget {
  const LogBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'log:B',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF135BEC),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color(0xFF135BEC),
          primary: const Color(0xFF135BEC),
          surface: const Color(0xFF101622),
        ),
        scaffoldBackgroundColor: const Color(0xFF101622),
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF101622),
          foregroundColor: Color(0xFFF1F5F9),
          elevation: 0,
        ),
      ),
      home: const MainNavigation(),
    );
  }
}
