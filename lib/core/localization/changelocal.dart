import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/services.dart';
import '../constant/apptheme.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeArabic;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }


  @override
  void onInit() {
    String? sharedPreLang = myServices.sharedPreferences.getString("lang");
    language = const Locale("ar");
    // if (sharedPreLang == "ar") {
    //   language = const Locale("ar");
    //   appTheme = themeArabic;
    // } else if (sharedPreLang == "en") {
    //   language = const Locale("en");
    //   appTheme = themeEnglish;
    // } else {
    //   language = Locale(Get.deviceLocale!.languageCode);
    //   appTheme = themeEnglish;
    // }
    super.onInit();
  }
}
