import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

import 'helper/enum.dart';
import 'helper/short_term_manager.dart';

class MainViewModel extends ChangeNotifier {

  Locale? _appLocale;
  String? dropDownValue;
  late AddLanguageDefaultListeners addLanguageDefaultListeners;

  Locale get appLocal {
    return _appLocale ?? Locale(ui.window.locale.languageCode);
  }

  init(AddLanguageDefaultListeners addLanguageDefaultListeners) {
    this.addLanguageDefaultListeners = addLanguageDefaultListeners;
    appLocalsFrom().whenComplete(() => {});
    getTheDropDownList();
  }
//change language
  Future<String> appLocalsFrom() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(KeyShared.language.name);
    if (value == null) {
      _appLocale = Locale(ui.window.locale.languageCode);
      prefs.setString(
          KeyShared.language.name,
          _appLocale?.languageCode ?? ui.window.locale.languageCode)
          .then((value) {
        notifyListeners();
      });
      ShortTermManager().setLanguage(_appLocale?.languageCode);
      return ShortTermManager().getLanguage() ?? ui.window.locale.languageCode;
    } else {
      ShortTermManager().setLanguage(value);
      _appLocale = Locale(value);
      notifyListeners();
      return value;
    }
  }

  void changeDirection(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(KeyShared.language.name, language).then((value) {
      _appLocale = Locale(language);
      ShortTermManager().setLanguage(language);
      notifyListeners();
    });
  }

  void setTheDropDownList(String dropDownValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("data",dropDownValue).then((value) {
      ShortTermManager().setDropDownList(dropDownValue);
      notifyListeners();
    });
  }
  void getTheDropDownList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dropDownValue = prefs.getString("data") ?? "english";
    notifyListeners();
  }

void changeLanguage()
{
  if (_appLocale?.languageCode=='en')
  {
    _appLocale=Locale("ar");
  }
  else
  {
    _appLocale=Locale("en");
  }
  notifyListeners();

}
}


abstract class AddLanguageDefaultListeners {}
