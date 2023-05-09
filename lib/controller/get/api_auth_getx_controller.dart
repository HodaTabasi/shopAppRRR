import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/reposetory/data_repo.dart';

class AuthGETXController {
  Future<ApiResponse> login({user}) async {
    return await DataRepository().login(user: user);
  }

  Future<ApiResponse> register({user}) async {
    return await DataRepository().register(user: user);
  }

  Future<ApiResponse> updateUser({user}) async {
    return await DataRepository().updateUser(user: user);
  }
}