import 'package:rrr_shop_app/controller/data/api/api_controller.dart';
import 'package:rrr_shop_app/controller/data/api/api_helper.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/model/category.dart';
import 'package:rrr_shop_app/controller/data/model/order.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/controller/data/model/slider.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';

class DataRepository with ApiHelper{
  final _apiController = APIController();
  DataRepository._();
  static DataRepository? _instance;

  factory DataRepository(){
    return _instance??=DataRepository._();
  }

  Future<List<Product>> getAllProduct() async {
    final jsonResponse = await _apiController.getAllProduct();
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => Product.fromJson(jsonObject)).toList();

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

  Future<List<Order>> getOrders({statusId}) async {
    final jsonResponse = await _apiController.getOrders(statusId: statusId);
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => Order.fromJson(jsonObject)).toList();

  }

 Future<ApiResponse> addOrder({order}) async {
    final jsonResponse = await _apiController.addOrder(order: order);
    return jsonResponse['success'] ?successResponce:failedResponse;
  }

  Future<List<MySlider>> getSliders() async {
    final jsonResponse = await _apiController.getSliders();
    var jsonArray = jsonResponse['data'] as List;
    return jsonArray.map((jsonObject) => MySlider.fromJson(jsonObject)).toList();
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
}