import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../preferences/shared_pref_controller.dart';

class LanguageGETXController extends GetxController{
  static LanguageGETXController get to => Get.find<LanguageGETXController>();

  String language = SharedPrefController()
      .getValueFor<String>(key: PrefKeys.lang.name) ==
      null
      ? 'ar'
      : SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)!;

  void changeLanguage(langValue,context) {
    // language = language == 'ar'.obs ? 'en'.obs : 'ar'.obs;
    language = langValue;
    SharedPrefController().changeLanguage(language: language);
    // context.setLocale(Locale(language));
    update();
    // var locale = Locale(language.value);
    // Get.updateLocale(locale);
    // language.refresh();
    // print(language.value);
  }
}