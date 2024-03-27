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

  final Map<String, Map<String, String>> _localizedValues = {
    'en' : {
      "english" : "English",
      "arabic" : "Arabic",
      "selectLanguage" : "Select Language",
      "createYourVirtAm": "Create your VirtAm id",
      "createYourVirtAmSmallText": "You will get 90 days free trial on creating new account.\n Make sure you use correct information",


      "fullName": "Full Name",
      "email": "Email Address",
      "existEmail": "Email Already Exists",
      "errorExistEmail": "The email address you provided is already registered. Please use a different email address.",
      "phoneNumber": "Phone Number",
      "password": "Password",
      "rePassword": "Re-write Password",
      "shouldContain": "password should contain :",
      "condition1": "one letter at least",
      "condition2": "one letter at least",
      "condition3": "one letter at least",
      "condition4": "one letter at least",
      "condition5": "one letter at least",
      "purpose": "The purpose of creating the account?",
      "purpose1": "Follow my personal data",
      "purpose2": "Follow up with my nutrition counselor",
      "purpose3": "Find a nutrition counselor in my area",
      "agree": "I agree to  the Terms and Privacy Policy",
      "noteReg": "By agreeing to the above terms, you are consenting that your personal information will be collected, stored, and processed ",


    }
    ,
    'ar' :{
      "selectLanguage" : "اختيار اللغة",
      "arabic": "العربية",
      "english" : "انجليزي",
      "createYourVirtAm": "قم بإنشاء معرف VirtAm الخاص بك",
      "createYourVirtAmSmallText": "سوف تحصل على نسخة تجريبية مجانية مدتها 90 يومًا عند إنشاء حساب جديد.\n  تأكد من استخدام المعلومات الصحيحة",


      "fullName": "الاسم الكامل",
      "email": "عنوان البريد الإلكتروني",
      "existEmail": "البريد الإلكتروني موجود بالفعل",
      "errorExistEmail": "البريد الإلكتروني الذي قدمته مسجل بالفعل. يرجى استخدام عنوان بريد إلكتروني مختلف.",
      "phoneNumber": "رقم الهاتف",
      "password": "كلمة المرور",
      "rePassword": "إعادة كتابة كلمة المرور",
      "shouldContain": "يجب أن تحتوي كلمة المرور على:",
      "condition1": "حرف واحد على الأقل",
      "condition2": "حرف كبير واحد على الأقل",
      "condition3": "رقم واحد على الأقل",
      "condition4": "ثمانية أحرف على الأقل",
      "condition5": "حرف خاص واحد على الأقل",
      "purpose": "هدف إنشاء الحساب؟",
      "purpose1": "متابعة بياناتي الشخصية",
      "purpose2": "متابعة مستشار التغذية الخاص بي",
      "purpose3": "العثور على مستشار تغذية في منطقتي",
      "agree": "أوافق على الشروط وسياسة الخصوصية",
      "noteReg": "بالموافقة على الشروط أعلاه، فإنك توافق على أن يتم جمع معلوماتك الشخصية وتخزينها ومعالجتها."


    }

  };
  String? get name{
    return _localizedValues[locale.languageCode]?['name'];
  }

  String? get mobileNumber{
    return _localizedValues[locale.languageCode]?['mobileNumber'];
  }

  String? get organizationId{
    return _localizedValues[locale.languageCode]?['organizationId'];
  }

  String? get email{
    return _localizedValues[locale.languageCode]?['email'];
  }

  String? get password{
    return _localizedValues[locale.languageCode]?['password'];
  }

  String? get reTypeEmail{
    return _localizedValues[locale.languageCode]?['reTypeEmail'];
  }

  String? get reTypePass{
    return _localizedValues[locale.languageCode]?['reTypePass'];
  }

  String? getTranslatedValue(String key) {
    return _localizedValues[locale.languageCode]?[key];
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

