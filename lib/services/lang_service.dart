import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'locals/en_US.dart';

class LangService extends Translations {
  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final items = [
    'English',
    'Русский',
    'O\'zbek',
  ];

  static final langs = [
    'en',
    'ru',
    'uz',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('ru', 'RU'),
    const Locale('uz', 'UZ'),
  ];

  static Locale defLanguage(String code) {
    var index = langs.indexOf(code);
    return locales[index];
  }

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs, // lang/en_us.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
    }
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }

  String defaultLanguage() {
    final locale = Get.locale;
    var lan = locale.toString();
    if (lan == "ru_RU") return langs[1];
    if (lan == "uz_UZ") return langs[2];
    return langs[0];
  }
}
