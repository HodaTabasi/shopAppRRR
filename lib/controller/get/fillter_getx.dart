import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:qerat/models/api_moduel/Funeral.dart';
//
// import '../helper/shared_pref/shared_prefrences_helper.dart';
// import '../models/api_moduel/share_app.dart';
import '../preferences/shared_pref_controller.dart';

class FillterGetXController extends GetxController {
  static FillterGetXController get to => Get.find<FillterGetXController>();

  int valueType = 0;
  double minPrice = 0;
  double maxPrice = 0;
  String color = "#000000";
  String size = "36";
  int categoryId = 1;

}
