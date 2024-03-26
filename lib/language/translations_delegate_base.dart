import 'dart:async';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import '../helper/short_term_manager.dart';

class TranslationBase {
  TranslationBase(this.locale);

  final Locale locale;

  static TranslationBase of(BuildContext context) {
    return Localizations.of<TranslationBase>(context, TranslationBase) ??
        TranslationBase(Locale(ShortTermManager().language ?? "en"));
  }

  final Map<String, Map<String, String>> _languageItems = {
    'en': {
      //'enIcon': "assets/icons/icon_en.png",
      'english': "English",
      //'arIcon': "assets/icons/icon_saudi_arabia.png",
      'arabic': "Arabic",
    },
    'ar': {
      //'enIcon': "assets/icons/icon_en.png",
      'english': "إنجليزي",
      //'arIcon': "assets/icons/icon_saudi_arabia.png",
      'arabic': "عربي",
    },
  };

  String? get english{
    return _languageItems[locale.languageCode]?['english'];
  }
  String? get arabic {
    return _languageItems[locale.languageCode]?['arabic'];
  }

  String? get enIcon {
    return _languageItems[locale.languageCode]?['enIcon'];
  }

  String? get arIcon {
    return _languageItems[locale.languageCode]?['arIcon'];
  }



}

class TranslationBaseDelegate extends LocalizationsDelegate<TranslationBase> {
  const TranslationBaseDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<TranslationBase> load(Locale locale) {
    return SynchronousFuture<TranslationBase>(TranslationBase(locale));
  }

  @override
  bool shouldReload(TranslationBaseDelegate old) => false;
}
