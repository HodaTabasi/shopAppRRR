import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/reposetory/data_repo.dart';

class AuthGETXController extends GetxController {

  static AuthGETXController get to => Get.find<AuthGETXController>();


  Future<ApiResponse> login({phone}) async {
    return await DataRepository().login(phone: phone);
  }

  Future<ApiResponse> register({user}) async {
    return await DataRepository().register(user: user);
  }

  Future<ApiResponse> updateUser({user}) async {
    return await DataRepository().updateUser(user: user);
  }
}