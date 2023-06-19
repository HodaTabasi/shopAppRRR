
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

import '../../data/api/api_response.dart';
import '../../data/model/add_order_responce.dart';
import '../../data/model/order.dart';
import '../../data/model/product.dart';
import '../../data/reposetory/data_repo.dart';
import '../../preferences/shared_pref_controller.dart';
import '../hive_getx_controller.dart';

class OrderGetxController extends GetxController {
  RxList<Order> orders = <Order>[].obs;
   RxBool isLoading = false.obs;
  RxBool isPageLoading = false.obs;
  RxBool flagLoad = false.obs;
  int lastPage = 1;
  int currentPage = 1;

  static OrderGetxController get to => Get.find<OrderGetxController>();

  getOrders({statusId,page}) {
    isLoading.value = true;
    orders.clear();
    DataRepository().getOrders(statusId: statusId).then((value) {
      orders.value = value.data!;
      isLoading.value = false;
    });
  }

  Future<AddOrderResponse> addOrder({order}) async {
    return await DataRepository().addOrder(order: order);
  }

  Future<ApiResponse> cancelOrder({id}) async {
    return await DataRepository().cancelOrder(id: id);
  }
  changeExpanded(index, isExpanded) {
    orders[index].isExpanded = isExpanded;
  }

}