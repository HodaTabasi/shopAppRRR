import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../preferences/shared_pref_controller.dart';

class LanguageGETXController extends GetxController{
  static LanguageGETXController get to => Get.find<LanguageGETXController>();

  Rx<String> language = SharedPrefController()
      .getValueFor<String>(key: PrefKeys.lang.name) ==
      null
      ? 'ar'.obs
      : SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)!.obs;

  void changeLanguage(langValue) {
    // language = language == 'ar'.obs ? 'en'.obs : 'ar'.obs;
    language.value = langValue;
    SharedPrefController().changeLanguage(language: language.value);
    // var locale = Locale(language.value);
    // Get.updateLocale(locale);
    // language.refresh();
    print(language.value);
  }
}