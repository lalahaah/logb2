import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/main_navigation.dart';
import 'providers/language_provider.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const LogBApp(),
    ),
  );
}

class LogBApp extends StatelessWidget {
  const LogBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          title: 'log:B',
          locale: languageProvider.currentLocale,
          supportedLocales: const [Locale('ko', ''), Locale('en', '')],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
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
      },
    );
  }
}
