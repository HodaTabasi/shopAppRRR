import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:qerat/models/api_moduel/Funeral.dart';
//
// import '../helper/shared_pref/shared_prefrences_helper.dart';
// import '../models/api_moduel/share_app.dart';
import '../preferences/shared_pref_controller.dart';

class GeneralDataController extends GetxController {
  /*Theme*/
  // RxBool isDark = false.obs;
  RxBool isLocalNotification = true.obs;

  void changeIsLocalNotification(bool value) async {
    isLocalNotification.value = value;
    SharedPrefController().setLocalNotification(value);
  }

  void getLocalNotification() async {
    isLocalNotification.value = (await SharedPrefController()
            .getLocalNotification()) ??
        true;
  }
}
