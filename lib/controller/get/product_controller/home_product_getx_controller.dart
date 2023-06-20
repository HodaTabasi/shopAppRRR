
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/utils/constants.dart';

import '../../data/model/product.dart';
import '../../data/reposetory/data_repo.dart';
import '../../preferences/shared_pref_controller.dart';
import '../hive_getx_controller.dart';

class HomeGetxController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxMap<String, List<Product>> productMap = <String, List<Product>>{}.obs;
  RxBool isLoading = false.obs;
  RxBool isPageLoading = false.obs;
  int lastPage = 1;
  int currentPage = 1;

  static HomeGetxController get to => Get.find<HomeGetxController>();

/*هنا سيتم حل موضوع التخزين لوكال مع الباجيناشن*/
  // getAllProduct({page}) {
  //   if (SharedPrefController().lastUpdate.isEmpty) {
  //     print("Fgdfg");
  //     get(page: page);
  //   } else {
  //     print("Fgdfg");
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


  getAllProduct({page}) async {
    print(page);
    if (await checkStatus()) {
          get(page: page);
        } else {
            List<Product> p = HiveGetXController.to.readAllProduct();
            if(p != null){
              productMap.addAll({"all": p});
              productMap.addAll(
                  {"trend": p.where((element) => element.trend == 1).toList()});
              productMap.addAll(
                  {"new": p.where((element) => element.newProduct == 1).toList()});
              productMap.addAll(
                  {"offers": p.where((element) => element.offer == 1).toList()});
              products.value = productMap["new"] ?? [];
            }else {
              productMap['trend'] = [];
              productMap['new'] = [];
              productMap['offers'] = [];
              productMap['all'] = [];
            }

        }
  }

  get({page = 1}) {
    print(page);
    if(currentPage==1){
      isLoading.value = true;
      DataRepository().getAllProduct(page: page).then((value) async {
        lastPage = value.lastPage!;
        productMap.addAll({"all": value.data!});
        productMap.addAll({"trend": value.data!.where((element) => element.trend == 1).toList()});
        productMap.addAll({"new": value.data!.where((element) => element.newProduct == 1).toList()});
        productMap.addAll({"offers": value.data!.where((element) => element.offer == 1).toList()});
        products.value = productMap["new"] ?? [];

        await SharedPrefController().lastUpdate1(DateFormat('yyyy-MM-dd – kk:mm')
            .format(DateTime.now().add(const Duration(days: 1))));
        await HiveGetXController.to.addAllProduct(products.value);

          isLoading.value = false;
      });
    }else {
      isPageLoading.value = true;
      DataRepository().getAllProduct(page: page).then((value) async {
        print("Dfsdfsdfsf ${value.data!.length}");
        lastPage = value.lastPage!;
        productMap.addAll({"all": value.data!});
        productMap["trend"]!.addAll(value.data!.where((element) => element.trend == 1));
        productMap["new"]!.addAll(value.data!.where((element) => element.newProduct == 1));
        productMap["offers"]!.addAll(value.data!.where((element) => element.offer == 1));
        products.value = productMap["new"] ?? [];
        print(products.length);

        await SharedPrefController().lastUpdate1(DateFormat('yyyy-MM-dd – kk:mm')
            .format(DateTime.now().add(const Duration(days: 1))));
        await HiveGetXController.to.addAllProduct(products.value);

        isPageLoading.value = false;
      });
    }

  }

  void deleteFromProductCount(orderProduct) {
    for(var v in orderProduct){
      if( productMap['all'] != null && productMap['all']!.contains(v)){
        int index = productMap['all']!.indexWhere((element) => element == v);
        int i = int.parse(productMap['all']![index].productQty!) -1;
        productMap['all']![index].productQty = i.toString();
      }
      // else if(productMap['trend'] != null && productMap['trend']!.contains(v)){
      //   int index = productMap['trend']!.indexWhere((element) => element == v);
      //   int i = int.parse(productMap['trend']![index].productQty!) -1;
      //   productMap['trend']![index].productQty = i.toString();
      // }else if(productMap['offers'] != null &&productMap['offers']!.contains(v)) {
      //   int index = productMap['offers']!.indexWhere((element) => element == v);
      //   int i = int.parse(productMap['offers']![index].productQty!) -1;
      //   productMap['offers']![index].productQty = i.toString();
      // }
    }
    orderProduct.clear();
  }
}