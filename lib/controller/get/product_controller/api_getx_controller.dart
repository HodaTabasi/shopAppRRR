import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/model/category.dart';
import 'package:rrr_shop_app/controller/data/model/notification.dart';
import 'package:rrr_shop_app/controller/data/model/slider.dart';
import 'package:rrr_shop_app/controller/data/reposetory/data_repo.dart';
import 'package:rrr_shop_app/controller/get/hive_getx_controller.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_custom_radio.dart';
import '../../data/model/add_order_responce.dart';
import '../../data/model/order.dart';
import '../../data/model/product.dart';
import '../../data/model/rate.dart';

class APIGetxController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<Product> relatedProducts = <Product>[].obs;
  RxList<Product> FillterResult = <Product>[].obs;
  RxList<Product> orderProduct = <Product>[].obs;
  // Map<String, List<Product>> productMap = {};
  // RxList<Order> orders = <Order>[].obs;
  RxList<MySlider> sliders = <MySlider>[].obs;
  RxList<Category> cate = <Category>[].obs;
  late Rx<Product> product = Product().obs;
  Category? category;
  bool flag = false;
  bool cartFlag = false;
  int productId = 0;
  String color = "#000000";
  String size = "36";

  RxBool isLoading = false.obs;
  RxBool flagLoad = false.obs;

  List<RadioModel> sampleData = [];
  RxString address = "الخرطوم السودان".obs;
  var rate;

  XFile? pickedFile;
  late Rx<XFile> picke = XFile("").obs;

  static APIGetxController get to => Get.find<APIGetxController>();

  RxInt  total  = 0.obs;

  changeFile(XFile? xFile) {
    picke.value = XFile(xFile!.path);
  }

  // getAllProduct({page}) {
  //
  //
  //   if (SharedPrefController().lastUpdate.isEmpty) {
  //     get(page: page);
  //   } else {
  //     if (DateFormat('yyyy-MM-dd – kk:mm')
  //         .parse(SharedPrefController().lastUpdate)
  //         .isBefore(DateTime.now())) {
  //       get(page: page);
  //     } else {
  //       List<Product> p = HiveGetXController.to.readAllProduct();
  //       productMap.addAll(
  //           {"trend": p.where((element) => element.trend == 1).toList()});
  //       productMap.addAll(
  //           {"new": p.where((element) => element.newProduct == 1).toList()});
  //       productMap.addAll(
  //           {"offers": p.where((element) => element.offer == 1).toList()});
  //       products.value = productMap["new"] ?? [];
  //     }
  //   }
  // }
  //
  // get({page = 1}) {
  //   isLoading.value = true;
  //   DataRepository().getAllProduct(page: page).then((value) async {
  //     productMap.addAll(
  //         {"trend": value.data!.where((element) => element.trend == 1).toList()});
  //     productMap.addAll(
  //         {"new": value.data!.where((element) => element.newProduct == 1).toList()});
  //     productMap.addAll(
  //         {"offers": value.data!.where((element) => element.offer == 1).toList()});
  //     products.value = productMap["new"] ?? [];
  //     await SharedPrefController().lastUpdate1(DateFormat('yyyy-MM-dd – kk:mm')
  //         .format(DateTime.now().add(const Duration(days: 1))));
  //     await HiveGetXController.to.addAllProduct(products.value);
  //     isLoading.value = false;
  //   });
  // }

  getProductDetails({productId}) {
    isLoading.value = true;
    DataRepository().getProductDetails(productId: productId).then((value) {
      product.value = value;
      sampleData.clear();
      product.value.productSize!.split(",").forEach((element) {
        sampleData.add(RadioModel(false, element, element));
      });
      rate = (product.value.ratings!.isEmpty?4.5:product.value.ratings!.map((m) => m.starRating!).reduce((a, b) => a + b) / product.value.ratings!.length).toStringAsFixed(2);
      isLoading.value = false;
    });
  }

  // getNewProducts() {
  //   DataRepository().getNewProduct().then((value) {
  //     products.value = value;
  //     productMap.addAll(
  //         {"trend": value.where((element) => element.trend == 1).toList()});
  //     productMap.addAll(
  //         {"new": value.where((element) => element.newProduct == 1).toList()});
  //     productMap.addAll(
  //         {"offers": value.where((element) => element.offer == 1).toList()});
  //   });
  // }

  // getOrders({statusId}) {
  //   isLoading.value = true;
  //   orders.clear();
  //   DataRepository().getOrders(statusId: statusId).then((value) {
  //     orders.value = value.data!;
  //     isLoading.value = false;
  //   });
  // }

  Future<List<MyNotification>> getNotification() async {
    return await DataRepository().getNotifications();
  }

  getTotalPrice() {
    total.value = 0;
    APIGetxController.to.orderProduct.forEach((element) {
      element.selectedQty??=1;
      if(element.discountPrice == 0){
        total.value += (element.selectedQty! * num.parse(element.sellingPrice!)).toInt();
      }else {
        total.value += (element.selectedQty! * num.parse(getDiscountPrice(element.discountPrice!, element.sellingPrice!))).toInt();
      }
    });
  }

  // Future<ApiResponse> cancelOrder({id}) async {
  //   return await DataRepository().cancelOrder(id: id);
  // }

  // changeExpanded(index, isExpanded) {
  //   orders[index].isExpanded = isExpanded;
  // }

  // Future<AddOrderResponse> addOrder({order}) async {
  //   return await DataRepository().addOrder(order: order);
  // }

  getFiltter({search}) {
    isLoading.value = true;
    DataRepository().Filtter(search: search).then((value) {
      FillterResult.value = value;

      isLoading.value = false;
    });
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
      isLoading.value = false;
    });
  }

  getProductBySubCateId({id, subId}) async {
    DataRepository().getProductBySubCateId(id: id, subId: subId).then((value) {
      products.value = value;
      isLoading.value = false;
    });
  }

  Future<ApiResponse> addRating({required Rating rating}) async {
    isLoading.value = true;
   return await DataRepository().addProductRate(rating: rating).then((value) {
     if(value['success']){
       print("d");
       product.value.ratings!.add(Rating.fromJson(value['data']));
       update();
     }
     isLoading.value = false;
     return ApiResponse(message:value['message'],success: value['success']);

    });
  }

  getProduct() {
    isLoading.value = true;
    if (flag) {
      getProductBySubCateId(
          id: category!.id.toString(), subId: category!.subCategory.toString());
    } else {
      getProductByCateId(id: category!.id.toString());
    }
  }

  putOrderProduct({list}) {
    orderProduct.value = list;
    // print(orderProduct.value);
  }

  // void deleteFromProductCount() {
  //   for(var v in orderProduct){
  //     if( productMap['new'] != null && productMap['new']!.contains(v)){
  //       int index = productMap['new']!.indexWhere((element) => element == v);
  //       int i = int.parse(productMap['new']![index].productQty!) -1;
  //       productMap['new']![index].productQty = i.toString();
  //     }else if(productMap['trend'] != null && productMap['trend']!.contains(v)){
  //       int index = productMap['trend']!.indexWhere((element) => element == v);
  //       int i = int.parse(productMap['trend']![index].productQty!) -1;
  //       productMap['trend']![index].productQty = i.toString();
  //     }else if(productMap['offers'] != null &&productMap['offers']!.contains(v)) {
  //       int index = productMap['offers']!.indexWhere((element) => element == v);
  //       int i = int.parse(productMap['offers']![index].productQty!) -1;
  //       productMap['offers']![index].productQty = i.toString();
  //     }
  //   }
  //   orderProduct.clear();
  // }
}
