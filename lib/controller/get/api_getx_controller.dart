import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/model/category.dart';
import 'package:rrr_shop_app/controller/data/model/slider.dart';
import 'package:rrr_shop_app/controller/data/reposetory/data_repo.dart';

import '../data/model/order.dart';
import '../data/model/product.dart';

class APIGetxController extends GetxController{
  RxList<Product> products = <Product>[].obs;
  RxList<Order> orders = <Order>[].obs;
  RxList<Slider> sliders = <Slider>[].obs;
  RxList<Category> cate = <Category>[].obs;
  Product? product;

  static APIGetxController get to => Get.find<APIGetxController>();


  getAllProduct(){
    DataRepository().getAllProduct().then((value){
      products.value = value;
    });
  }

  getProductDetails({productId}){
    DataRepository().getProductDetails(productId: productId).then((value){
      product = value;
    });
  }

  getNewProducts(){
    DataRepository().getNewProduct().then((value){
      products.value = value;
    });
  }

  getOrders({statusId}){
    DataRepository().getOrders(statusId: statusId).then((value){
      orders.value = value;
    });
  }

  Future<ApiResponse> addOrder({order}) async {
    return await DataRepository().addOrder(order: order);
  }

  getSliders(){
    DataRepository().getSliders().then((value){
      sliders.value = value;
    });
  }

  getAllCategory(){
    DataRepository().getAllCategory().then((value){
      cate.value = value;
    });
  }

  getSubCategory(){
    DataRepository().getSubCategory().then((value){
      cate.value = value;
    });
  }
}