import 'package:easy_localization/easy_localization.dart' as data;
import 'package:get/get.dart';
import 'package:rrr_shop_app/utils/constants.dart';

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
  RxBool NetFound = true.obs;

  static OrderGetxController get to => Get.find<OrderGetxController>();

  getOrders({statusId, page}) async {
    if (await checkStatus()) {
      isLoading.value = true;
      orders.clear();
      DataRepository().getOrders(statusId: statusId).then((value) {
        orders.value = value.data!;
        isLoading.value = false;
      });
    }else {
      NetFound.value = false;
    }
  }

  Future<AddOrderResponse> addOrder({order}) async {
    if (await checkStatus()) {
      return await DataRepository().addOrder(order: order);
    } else {
      return AddOrderResponse(message: data.tr('no_internet'), success: false);
    }
  }

  Future<ApiResponse> cancelOrder({id}) async {
    if (await checkStatus()) {
      return await DataRepository().cancelOrder(id: id);
    } else
      return ApiResponse(success: false, message: data.tr('no_internet'));
  }

  changeExpanded(index, isExpanded) {
    orders[index].isExpanded = isExpanded;
  }
}
