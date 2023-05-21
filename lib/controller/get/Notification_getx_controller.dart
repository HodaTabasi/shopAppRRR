import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../preferences/shared_pref_controller.dart';

class NotificationGetxController extends GetxController {
  static NotificationGetxController get to => Get.find<NotificationGetxController>();

  int notificationNumber = 0;


  // @override
  // void onInit() {
  //   SharedPrefController().setNotificaionNumber(0);
  // }

  addNotification() async {
    await SharedPrefController().addNotification();
    notificationNumber = SharedPrefController().notificaionNumber;
    print(notificationNumber);
    update();
  }
  getNotificationNumber(){
    notificationNumber = SharedPrefController().notificaionNumber;
    update();
  }

  clearNotification() async {
    await SharedPrefController().setNotificaionNumber(0);
    notificationNumber = SharedPrefController().notificaionNumber;
    update();
  }

}
