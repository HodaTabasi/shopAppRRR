import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_setting.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';
import 'package:rrr_shop_app/core/skeleton.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../../../controller/data/api/api_response.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  List<int> l = [1, 2, 3, 5];
  late TabController controller;

  late TabController tabController;

  int currentIndex = 0;
  int expandIndex = -1;


  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    APIGetxController.to.getOrders(statusId: currentIndex + 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        toolbarHeight: 60.h,
        title: const Text(
          "order",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ).tr(),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          buildContainer(),
          getSpace(h: 16.r),
          GetX<APIGetxController>(builder: (controller) {
            return controller.isLoading.value
                ? buildShimmer()
                : Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: controller.orders.isEmpty ?
                        Center(child: Text("no_data_found",style: TextStyle(fontSize: 18.sp,color: mainColor),).tr(),)
                        :ExpansionPanelList(
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            controller.changeExpanded(panelIndex, !isExpanded);
                          });
                        },
                        dividerColor: divider,
                        expandedHeaderPadding: EdgeInsets.all(16.r),
                        children: controller.orders.map((order) {
                          return ExpansionPanel(
                            isExpanded: order.isExpanded,
                            canTapOnHeader: true,
                            headerBuilder: (context, isExpanded) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0.r, horizontal: 8.r),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        child: Image.network(
                                          "${APISetting.IMAGE_BASE_URL}${order.orderProducts![0].productImage}",
                                          height: 55,
                                          width: 66,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Text(
                                    "${order.id}#",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  )
                                ],
                              );
                            },
                            body: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.r),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.r),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "product_name",
                                          style: TextStyle(
                                            color: textColor,
                                          ),
                                        ).tr(),
                                        getSpace(w: 5.r),
                                        Text(
                                          "${order.orderProducts!.map((e) {
                                            return SharedPrefController().getValueFor(key: PrefKeys.lang.name) == 'ar'?e.productNameAr:e.productNameEn;
                                          }).toList()}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  getSpace(h: 15.0.r),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.r),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "product_price",
                                          style: TextStyle(
                                            color: textColor,
                                          ),
                                        ).tr(),
                                        getSpace(w: 5.r),
                                        Text(
                                          "${order.totalPrice}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  getSpace(h: 15.0.r),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.r),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "order_status",
                                          style: TextStyle(
                                            color: textColor,
                                          ),
                                        ).tr(),
                                        getSpace(w: 5.r),
                                        Text(
                                          "${order.statusId}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  getSpace(h: 15.0.r),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.r),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "t_address",
                                          style: TextStyle(
                                            color: textColor,
                                          ),
                                        ).tr(),
                                        getSpace(w: 5.r),
                                        Text(
                                          " ${order.address} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  getSpace(h: 15.0.r),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.r),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "data_f",
                                          style: TextStyle(
                                            color: textColor,
                                          ),
                                        ).tr(),
                                        getSpace(w: 5.r),
                                        Text(
                                          "${order.username}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  getSpace(h: 15.0.r),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.r),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "phone",
                                          style: TextStyle(
                                            color: textColor,
                                          ),
                                        ).tr(),
                                        getSpace(w: 5.r),
                                        Text(
                                          "${order.phone}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  getSpace(h: 15.0.r),
                                  Divider(
                                    color: divider,
                                    thickness: 1,
                                  ),
                                  Stack(
                                    children: [
                                      Visibility(
                                        visible:(currentIndex + 1) == 1,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0.r),
                                          child: InkWell(
                                            onTap: () async {
                                              controller.flagLoad.value = true;
                                              ApiResponse responce = await controller.cancelOrder(id:order.id.toString());
                                              if(responce.success){
                                                controller.orders.remove(order);
                                                controller.flagLoad.value = false;
                                              }
                                            },
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Visibility(
                                                 visible:!controller.flagLoad.value,
                                                    child: Icon(Icons.clear,size: 20.r,color: Colors.red,)),
                                                Visibility(
                                                  visible:controller.flagLoad.value,
                                                  child: SizedBox(
                                                    height: 30.r,
                                                      width: 30.r,
                                                      child: CircularProgressIndicator()),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                                                  child: Text("cancel_order",style: TextStyle(color: Color(0xff4D4D4D),fontSize: 14.sp),).tr(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList()),
                  );
          })
        ],
      ),
    );
  }

  Container buildContainer() {
    return Container(
      decoration: decoration(radius: 2),
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: TabBar(
        controller: tabController,
        labelColor: Colors.white,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            APIGetxController.to.getOrders(statusId: currentIndex + 1);
          });
        },
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: mainColor,
        ),
        unselectedLabelColor: thirdColor,
        isScrollable: true,
        tabs: [
          Tab(
            icon: Text("pending").tr(),
          ),
          Tab(
            icon: Text("driving").tr(),
          ),
          Tab(
            icon: Text("completeo").tr(),
          ),
          Tab(
            icon: Text("cancel").tr(),
          )
        ],
      ),
    );
  }

  buildShimmer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Skeleton(
            height: 50.h,
            width: double.infinity,
          ),
          getSpace(h: 20.0.h),
          Skeleton(
            height: MediaQuery.of(context).size.height - 200.h,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
