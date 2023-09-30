import 'package:get/get.dart';

import '../../data/model/category.dart';
import '../../data/model/product.dart';
import '../../data/reposetory/data_repo.dart';

class GetSubCatGetxController extends GetxController {
  RxList<Product> products = <Product>[].obs;

  RxBool isLoading = false.obs;
  RxBool isPageLoading = false.obs;
  int lastPage = 1;
  int currentPage = 1;
  bool flag = false;
  Category? category;


  static GetSubCatGetxController get to => Get.find<GetSubCatGetxController>();

  getProduct({page}) {

    isLoading.value = true;
    products.clear();
    if (flag) {
      print(category!.subCategory.toString());
      getProductBySubCateId(
          id: category!.id.toString(), subId: category!.subCategory.toString(),page:page);
    } else {
      getProductByCateId(id: category!.id.toString(),page:page);
    }
  }

  getProductByCateId({id,page}) async {
    DataRepository().getProductByCateId(id: id,page: page).then((value) {
      products.value.addAll(value.data!);
      isLoading.value = false;
    });
  }

  getProductBySubCateId({id, subId,page}) async {
    DataRepository().getProductBySubCateId(id: id, subId: subId,page: page).then((value) {
      products.value.addAll(value.data!);
      isLoading.value = false;
    });
  }

}