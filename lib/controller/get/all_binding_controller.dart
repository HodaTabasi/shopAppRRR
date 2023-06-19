import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/get/product_controller/api_getx_controller.dart';

import 'api_auth_getx_controller.dart';
import 'hive_getx_controller.dart';
import 'languages_getx_controoler.dart';
import 'loading_getx_controller.dart';

class AllBindingController extends Bindings {
  @override
  void dependencies() {
    Get.put<APIGetxController>(APIGetxController());
    Get.put<AuthGETXController>(AuthGETXController());
    // Get.put<LanguageGETXController>(LanguageGETXController());
    Get.put<LoadingController>(LoadingController());
    Get.put<HiveGetXController>(HiveGetXController());
  }
  
}