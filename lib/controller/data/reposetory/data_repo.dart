import 'package:rrr_shop_app/controller/data/api/api_controller.dart';
import 'package:rrr_shop_app/controller/data/api/api_helper.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/model/AllProductResponse.dart';
import 'package:rrr_shop_app/controller/data/model/category.dart';
import 'package:rrr_shop_app/controller/data/model/order.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/controller/data/model/slider.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';

import '../model/PublicOffer.dart';
import '../model/add_order_responce.dart';
import '../model/getOrderResponse.dart';
import '../model/notification.dart';
import '../model/rate.dart';

class DataRepository with ApiHelper{
  final _apiController = APIController();
  DataRepository._();
  static DataRepository? _instance;

  factory DataRepository(){
    return _instance??=DataRepository._();
  }

  Future<AllProductResponse> getAllProduct({page}) async {
    final jsonResponse = await _apiController.getAllProduct(page: page);
    var jsonArray = jsonResponse['data'];
    return AllProductResponse.fromJson(jsonArray);
    // return jsonArray.map((jsonObject) => Product.fromJson(jsonObject)).toList();
  }

  Future<Product> getProductDetails({productId}) async {
    final jsonResponse = await _apiController.getProductDetails(productId: productId);
    return Product.fromJson(jsonResponse['data']);
  }

  Future<List<Product>> getNewProduct() async {
    final jsonResponse = await _apiController.getNewProduct();
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => Product.fromJson(jsonObject)).toList();
  }

  Future<AllProductResponse> getProductByCateId({id,page}) async {
    final jsonResponse = await _apiController.getProductByCateId(id: id,page:page);
    var jsonArray = jsonResponse['data'];
    return AllProductResponse.fromJson(jsonArray);

    // var jsonArray = jsonResponse['data']['data'] as List;
    // return jsonArray.map((jsonObject) => Product.fromJson(jsonObject)).toList();
  }

  Future<AllProductResponse> getProductBySubCateId({id,subId,page}) async {
    final jsonResponse = await _apiController.getProductBySubCateId(id: id,subId: subId,page:page);
    var jsonArray = jsonResponse['data'];
    return AllProductResponse.fromJson(jsonArray);
    // var jsonArray = jsonResponse['data']['data'] as List;
    // return jsonArray.map((jsonObject) => Product.fromJson(jsonObject)).toList();
  }

  Future<List<Rating>> getProductRate({id}) async {
    final jsonResponse = await _apiController.getProductRate(id: id);
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => Rating.fromJson(jsonObject)).toList();
  }

  Future<dynamic> addProductRate({required Rating rating}) async {
    final jsonResponse = await _apiController.addProductRate(rate: rating);
    // return failedResponse;
    return jsonResponse;
  }

  Future<getOrderResponse> getOrders({statusId,page}) async {
    final jsonResponse = await _apiController.getOrders(statusId: statusId,page: page);
    var jsonArray = jsonResponse['data'] ;
    return getOrderResponse.fromJson(jsonArray);
  }

 Future<AddOrderResponse> addOrder({order}) async {
    final jsonResponse = await _apiController.addOrder(order: order);
    // return failedResponse;
    return AddOrderResponse.fromJson(jsonResponse);
  }

  Future<List<MySlider>> getSliders() async {
    final jsonResponse = await _apiController.getSliders();
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => MySlider.fromJson(jsonObject)).toList();
  }

  Future<List<publicOffer>> getPublicOffer() async {
    final jsonResponse = await _apiController.getPublicOffer();
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => publicOffer.fromJson(jsonObject)).toList();
  }

  Future<List<Category>> getAllCategory() async {
    final jsonResponse = await _apiController.getAllCategory();
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => Category.fromJson(jsonObject)).toList();
  }

  Future<List<Category>> getSubCategory() async {
    final jsonResponse = await _apiController.getSubCategory();
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => Category.fromJson(jsonObject)).toList();
  }

  Future<List<MyNotification>> getNotifications() async {
    final jsonResponse = await _apiController.getNotifications();

    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) {
      print(MyNotification.fromJson(jsonObject));
      return MyNotification.fromJson(jsonObject);

    }).toList();
  }

 dynamic cancelOrder({id}) async {
    final jsonResponse = await _apiController.cancelOrder(id: id);
    if(jsonResponse['status']){
      return successResponce;
    }
    return failedResponse;
  }

  Future<List<Product>> Filtter({search}) async {
    final jsonResponse = await _apiController.Filtter(search:search);
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => Product.fromJson(jsonObject)).toList();
  }

  Future<ApiResponse> deleteUser({phone}) async {
    final jsonResponse = await _apiController.deleteUser(phone: phone);
    if(jsonResponse['success']){
      SharedPrefController().user = jsonResponse['data'];
      SharedPrefController().loggedIn = true;
      return successResponce;
    }
    return failedResponse;
  }

//////////////////////////////////////////////////////////////////

  dynamic login({phone}) async {
    final jsonResponse = await _apiController.login(phone: phone);
    if(jsonResponse['success']){
      SharedPrefController().user = jsonResponse['data'];
      SharedPrefController().loggedIn = true;
      return successResponce;
    }
    return failedResponse;
  }

  dynamic register({user}) async {
    final jsonResponse = await _apiController.register(user: user);
    if(jsonResponse['success']){
      SharedPrefController().user = jsonResponse['data'];
      SharedPrefController().loggedIn = true;
      return successResponce;
    }
    return failedResponse;
  }

  dynamic updateUser({user}) async {
    final jsonResponse = await _apiController.updateUser(user: user);
    if(jsonResponse['success']){
      SharedPrefController().user = jsonResponse['data'];
      return successResponce;
    }
    return failedResponse;
  }

  dynamic registerWithImage({path,user}) async {
    final jsonResponse = await _apiController.registerWithImage(path:path,user: user);
    if(jsonResponse['success']){
      SharedPrefController().user = jsonResponse['data'];
      SharedPrefController().loggedIn = true;
      return successResponce;
    }
    return failedResponse;
  }

  dynamic updateUserWithImage({path,user}) async {
    final jsonResponse = await _apiController.updateUserWithImage(path:path,user: user);
    if(jsonResponse['success']){
      SharedPrefController().user = jsonResponse['data'];
      return successResponce;
    }
    return failedResponse;
  }

  Future<String> getSetting() async {
    final jsonResponse = await _apiController.getSetting();
    if(jsonResponse != null){
      return jsonResponse['data'];
    }else {
      return '';
    }

  }

}