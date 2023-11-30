import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../constant/color.dart';
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

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Location", "Location services are disabled.",
          icon: const Icon(Icons.location_on),
          backgroundColor: AppColor.primaryColor,
          duration: const Duration(seconds: 1));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Location", "Location permissions are denied",
            icon: const Icon(Icons.location_on),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Location",
          "Location permissions are permanently denied, we cannot request permissions.",
          icon: const Icon(Icons.location_on),
          backgroundColor: AppColor.primaryColor,
          duration: const Duration(seconds: 1));
    }
    update();
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
