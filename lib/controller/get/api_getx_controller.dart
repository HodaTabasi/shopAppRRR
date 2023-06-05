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

import '../../utils/size_custom_radio.dart';
import '../data/model/order.dart';
import '../data/model/product.dart';

class APIGetxController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<Product> FillterResult = <Product>[].obs;
  RxList<Product> orderProduct = <Product>[].obs;
  Map<String, List<Product>> productMap = {};
  RxList<Order> orders = <Order>[].obs;
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

  changeFile(XFile? xFile) {
    picke.value = XFile(xFile!.path);
  }

  getAllProduct() {


    if (SharedPrefController().lastUpdate.isEmpty) {
      get();
    } else {
      if (DateFormat('yyyy-MM-dd – kk:mm')
          .parse(SharedPrefController().lastUpdate)
          .isBefore(DateTime.now())) {
        get();
      } else {
        List<Product> p = HiveGetXController.to.readAllProduct();
        productMap.addAll(
            {"trend": p.where((element) => element.trend == 1).toList()});
        productMap.addAll(
            {"new": p.where((element) => element.newProduct == 1).toList()});
        productMap.addAll(
            {"offers": p.where((element) => element.offer == 1).toList()});
        products.value = productMap["new"] ?? [];
      }
    }
  }

  get() {
    isLoading.value = true;
    DataRepository().getAllProduct().then((value) async {
      productMap.addAll(
          {"trend": value.where((element) => element.trend == 1).toList()});
      productMap.addAll(
          {"new": value.where((element) => element.newProduct == 1).toList()});
      productMap.addAll(
          {"offers": value.where((element) => element.offer == 1).toList()});
      products.value = productMap["new"] ?? [];
      await SharedPrefController().lastUpdate1(DateFormat('yyyy-MM-dd – kk:mm')
          .format(DateTime.now().add(const Duration(days: 1))));
      await HiveGetXController.to.addAllProduct(products.value);
      isLoading.value = false;
    });
  }

  getProductDetails({productId}) {
    isLoading.value = true;
    DataRepository().getProductDetails(productId: productId).then((value) {
      product.value = value;
      sampleData.clear();
      product.value.productSize!.split(",").forEach((element) {
        sampleData.add(RadioModel(false, element, element));
      });
      rate = product.value.ratings!.isEmpty?4.5:product.value.ratings!.map((m) => m.starRating!).reduce((a, b) => a + b) / product.value.ratings!.length;
      isLoading.value = false;
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
    isLoading.value = true;
    orders.clear();
    DataRepository().getOrders(statusId: statusId).then((value) {
      orders.value = value;
      isLoading.value = false;
    });
  }

  Future<List<MyNotification>> getNotification() async {
    return await DataRepository().getNotifications();
  }

  Future<ApiResponse> cancelOrder({id}) async {
    return await DataRepository().cancelOrder(id: id);
  }

  changeExpanded(index, isExpanded) {
    orders[index].isExpanded = isExpanded;
  }

  Future<ApiResponse> addOrder({order}) async {
    return await DataRepository().addOrder(order: order);
  }

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
}
