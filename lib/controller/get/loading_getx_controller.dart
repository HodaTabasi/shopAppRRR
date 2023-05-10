import 'package:get/get.dart';

class LoadingController extends GetxController{
  RxBool isLoading = false.obs;

  static LoadingController get to => Get.find<LoadingController>();

  changeLoading(bool value){
    isLoading.value = value;
  }
}