import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('ko'); // 기본값: 한국어

  Locale get currentLocale => _currentLocale;

  void changeLanguage(String languageCode) {
    if (_currentLocale.languageCode != languageCode) {
      _currentLocale = Locale(languageCode);
      notifyListeners();
    }
  }

  bool get isKorean => _currentLocale.languageCode == 'ko';
}
