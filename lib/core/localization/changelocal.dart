import 'package:final_ecommerce/core/constant/apptheme.dart';
import 'package:final_ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangeLocal extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appthemeData = themeDataArabic;
  changelang(String langcode) {
    Locale local = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appthemeData = langcode == "ar" ? themeDataArabic : themeDataEnglish;
    Get.changeTheme(appthemeData);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    String? sharedperf = myServices.sharedPreferences.getString("lang");
    if (sharedperf == "ar") {
      language = const Locale("ar");
      appthemeData = themeDataArabic;
    } else if (sharedperf == "en") {
      language = const Locale("en");
      appthemeData = themeDataEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
