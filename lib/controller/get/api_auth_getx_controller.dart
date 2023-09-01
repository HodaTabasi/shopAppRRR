import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/reposetory/data_repo.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart' as data;

class AuthGETXController extends GetxController {

  String phoneNumber = "";
  RxInt groupValue = 1.obs;
  bool flag = false;
  Rx<DateTime> date = DateTime.now().obs;
  RxBool loading = false.obs;

  static AuthGETXController get to => Get.find<AuthGETXController>();

  Future<ApiResponse> login({phone}) async {
    if(await checkStatus()){
      return await DataRepository().login(phone: phone);
    }else {
      return ApiResponse(success: false, message: data.tr('no_internet'));
    }

  }

  Future<ApiResponse> register({user}) async {
    if(await checkStatus()){
      return await DataRepository().register(user: user);
    }else {
      return ApiResponse(success: false, message: data.tr('no_internet'));
    }

  }

  Future<ApiResponse> updateUser({user}) async {
    if(await checkStatus()){
      return await DataRepository().updateUser(user: user);
    }else {
      return ApiResponse(success: false, message: data.tr('no_internet'));
    }

  }
  Future<ApiResponse> deleteUser({phone}) async {
    if(await checkStatus()){
      return await DataRepository().deleteUser(phone: phone.toString());
    }else {
      return ApiResponse(success: false, message: data.tr('no_internet'));
    }
  }


  Future<ApiResponse> registerWithImage({path,user}) async {
    if(await checkStatus()){
      return await DataRepository().registerWithImage(path:path,user: user);
    }else {
      return ApiResponse(success: false, message: data.tr('no_internet'));
    }

  }

  Future<ApiResponse> updateUserWithImage({path,user}) async {
    if(await checkStatus()){
      return await DataRepository().updateUserWithImage(path:path,user: user);
    }else {
      return ApiResponse(success: false, message: data.tr('no_internet'));
    }
  }

  changeValue(value){
    groupValue.value = value;
  }

  changeDate(newDate){
    date.value = newDate;
  }
}