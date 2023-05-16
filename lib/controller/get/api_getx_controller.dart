import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/model/category.dart';
import 'package:rrr_shop_app/controller/data/model/slider.dart';
import 'package:rrr_shop_app/controller/data/reposetory/data_repo.dart';

import '../data/model/order.dart';
import '../data/model/product.dart';

class APIGetxController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<Product> orderProduct = <Product>[].obs;
  Map<String, List<Product>> productMap = {};
  RxList<Order> orders = <Order>[].obs;
  RxList<MySlider> sliders = <MySlider>[].obs;
  RxList<Category> cate = <Category>[].obs;
  late Rx<Product> product = Product().obs;
  Category? category;
  bool flag = false;
  int productId = 0;
  String color = "#000000";
  String size = "36";

  static APIGetxController get to => Get.find<APIGetxController>();

  getAllProduct() {
    DataRepository().getAllProduct().then((value) {
      productMap.addAll(
          {"trend": value.where((element) => element.trend == 1).toList()});
      productMap.addAll(
          {"new": value.where((element) => element.newProduct == 1).toList()});
      productMap.addAll(
          {"offers": value.where((element) => element.offer == 1).toList()});
      products.value = productMap["new"] ?? [];
    });
  }

  getProductDetails({productId}) {
    DataRepository().getProductDetails(productId: productId).then((value) {
      product.value = value;
    });
  }

  getNewProducts() {
    DataRepository().getNewProduct().then((value) {
      products.value = value;
      productMap.addAll(
          {"trend": value.where((element) => element.trend == 1).toList()});
      productMap.addAll(
          {"new": value.where((element) => element.newProduct == 1).toList()});
      productMap.addAll(
          {"offers": value.where((element) => element.offer == 1).toList()});
    });
  }

  getOrders({statusId}) {
    DataRepository().getOrders(statusId: statusId).then((value) {
      orders.value = value;
    });
  }

  Future<ApiResponse> addOrder({order}) async {
    return await DataRepository().addOrder(order: order);
  }

  getSliders() async {
    sliders.value = await DataRepository().getSliders();
    /*
    * .then((value){
      sliders.value = value;
    })*/
  }

  getAllCategory() {
    DataRepository().getAllCategory().then((value) {
      cate.value = value;
    });
  }

  getSubCategory() {
    DataRepository().getSubCategory().then((value) {
      cate.value = value;
    });
  }

  getProductByCateId({id}) async {
    DataRepository().getProductByCateId(id: id).then((value) {
      products.value = value;
    });
  }

  getProductBySubCateId({id, subId}) async {
    DataRepository().getProductBySubCateId(id: id, subId: subId).then((value) {
      products.value = value;
    });
  }

  getProduct(){
    if(flag){
      getProductBySubCateId(id: category!.id.toString(),subId: category!.subCategory.toString());
    }else{
      getProductByCateId(id: category!.id.toString());
    }
  }

  putOrderProduct({list}){
    orderProduct.value = list;
  }
}
