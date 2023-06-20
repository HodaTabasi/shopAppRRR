import 'package:easy_localization/easy_localization.dart' as data;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/controller/data/model/user.dart';
import 'package:rrr_shop_app/controller/get/product_controller/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/hive_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/product_controller/get_order_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/product_controller/home_product_getx_controller.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../controller/data/model/add_order_responce.dart';
import '../../controller/data/model/order.dart';
import '../../core/app_order_card.dart';
import '../home/tebs/profile_tab/custom_dialog.dart';
import 'app_order_card.dart';

class CompleteOrderScreen extends StatefulWidget {
  @override
  State<CompleteOrderScreen> createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {
  // num total = 0;
  num city_cost = 0;
  num delivery_cost = 0;
  late User user;
  bool value = false;
  bool valueDelevery = false;

  @override
  void initState() {
    user = SharedPrefController().user;
    delivery_cost = 0;
    city_cost = 2500;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      APIGetxController.to.getTotalPrice();

  });
    super.initState();
  }

  // getTotalPrice() {
  //   APIGetxController.to.orderProduct.forEach((element) {
  //     element.selectedQty??=1;
  //     if(element.discountPrice == 0){
  //       total += element.selectedQty! * num.parse(element.sellingPrice!);
  //     }else {
  //       total += element.selectedQty! * num.parse(getDiscountPrice(element.discountPrice!, element.sellingPrice!));
  //     }
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        toolbarHeight: 60.h,
        title: const Text(
          "confirmation",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ).tr(),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18.r,
            )),
      ),
      body: GetX<APIGetxController>(builder: (controller) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              child: Text(
                "address",
                style: TextStyle(
                  color: textColor,
                ),
              ).tr(),
            ),
            getSpace(h: 8.0.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: DecoratedBox(
                decoration: decoration(radius: 25.0.r, blurRadius: 2),
                child: InkWell(
                  onTap: (){

                      Navigator.pushNamed(context, '/map_screen');

                    // Navigator.pushNamed(context, '/map_screen');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "${controller.address}",
                            maxLines: 3,
                            // "${value?controller.address:"الخرطوم السودان"}",
                            style: const TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis),
                          ).tr(),
                        ),
                        SvgPicture.asset("assets/images/address.svg")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            getSpace(h: 10.0.r),
            CheckboxListTile(value: value, onChanged: (val) {
              setState(() {
                value = val!;

                if(val){
                  city_cost = 3000;
                }else {
                  city_cost = 2500;
                }
              });


            },
            title: Text("outside",style: TextStyle(
              fontSize: 16.sp,
              color: mainColor,
              fontWeight: FontWeight.bold,
            ),textAlign: TextAlign.left,).tr()),

            getSpace(h: 15.0.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              child: Text(
                "payment_method",
                style: TextStyle(
                  color: textColor,
                ),
              ).tr(),
            ),
            getSpace(h: 8.0.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: DecoratedBox(
                decoration: decoration(radius: 25.0.r, blurRadius: 2),
                child: Padding(
                  padding: EdgeInsets.all(12.0.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "pay_on_resive",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ).tr(),
                      SvgPicture.asset("assets/images/payment.svg")
                    ],
                  ),
                ),
              ),
            ),
            getSpace(h: 15.0.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              child: Text(
                "products",
                style: TextStyle(
                  color: textColor,
                ),
              ).tr(),
            ),
            getSpace(h: 8.0.r),
            SizedBox(
              // height: 270,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: controller.orderProduct.length,
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      BuyListItemWidget(
                          isOrder: false,
                          product: controller.orderProduct[index]),
                      Positioned(
                          top: 8,
                          left: 8,
                          child: InkWell(
                              onTap: () {
                                if(controller.orderProduct.length == 1){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CoustomDialog(
                                          onClick: () async {
                                            Navigator.pushReplacementNamed(context, '/main_screen');
                                          },
                                          title: "do_cancel_order",
                                          image: "ff.svg",
                                        );
                                      });
                                }else {
                                  controller.orderProduct.removeAt(index);
                                }
                              },
                              child: SvgPicture.asset(
                                  "assets/images/delete.svg"))),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return getSpace(h: 16.h);
                },
              ),
            ),
            getSpace(h: 15.0.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "pay_cost",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ).tr(),
                  Text(
                    "EGP ${controller.total.value}",
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ],
              ),
            ),
            getSpace(h: 15.0.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ship_cost",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ).tr(),
                  Text(
                    "EGP ${delivery_cost + city_cost}",
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ],
              ),
            ),
            getSpace(h: 15.0.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "tax",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ).tr(),
                  Text(
                    "EGP 1000",
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: divider,
            ),
            getSpace(h: 15.0.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "total",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ).tr(),
                  Text(
                    "EGP ${(controller.total.value + 1000 + delivery_cost +city_cost).toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            getSpace(h: 10.0.r),
            CheckboxListTile(value: valueDelevery, onChanged: (val) {
              setState(() {
                valueDelevery = val!;
                if(val){
                  delivery_cost = 1000;
                }else {
                  delivery_cost = 0;
                }

              });
            },
                title: Text("fast_delivery",style: TextStyle(
                  fontSize: 16.sp,
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                ),textAlign: TextAlign.left,).tr()),

            getSpace(h: 5.0.r),
        if(valueDelevery)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("fast_delivery_msg",style: TextStyle(
          fontSize: 14.sp,
          color: Colors.red,
          fontWeight: FontWeight.bold,
          ),textAlign: TextAlign.left,).tr(),
        ),
            getSpace(h: 15.0.r),
            DecoratedBox(
              decoration: decoration(
                blurRadius: 2,
                radius: 15.r,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: Text(
                      "recipient_data",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ).tr(),
                  ),
                  Divider(
                    thickness: 1,
                    color: divider,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0.r, vertical: 8.r),
                    child: Text(
                      "${user.name}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0.r, vertical: 8.r),
                    child: Text(
                      "${user.phoneNumber}",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                  getSpace(h: 8.0.r),
                  BtnApp(title: data.tr("buy"), prsee: () => performBuying())
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  performBuying() async {
    AddOrderResponse response = await OrderGetxController.to.addOrder(order: order);
    showSnackBar(context: context,message: response.message,error: !response.success!);
    if(response.success!){
      if(APIGetxController.to.cartFlag){
        await HiveGetXController.to.deleteAllProductFromCart();
        APIGetxController.to.cartFlag = false;
      }
      HomeGetxController.to.deleteFromProductCount(APIGetxController.to.orderProduct);
      APIGetxController.to.relatedProducts.value = response.data!.relatedProducts??[];
      Navigator.pushNamedAndRemoveUntil(context, '/related_product_screen', (route) => false);

    }
  }

  Order get order {
    Order order1 = Order();
    order1.customerId = user.id;
    order1.totalPrice = (APIGetxController.to.total.value - delivery_cost).toInt().abs();
    order1.address = APIGetxController.to.address.value;
    order1.phone = user.phoneNumber.toString();
    order1.username = user.name.toString();
    order1.deliverPrice = delivery_cost;
    order1.fastDeliver = valueDelevery;
    order1.orderProducts = APIGetxController.to.orderProduct
        .map<OrderProducts>((element) {
      OrderProducts orderProducts = OrderProducts();
      orderProducts.productId = element.id;
      orderProducts.productSize = int.parse(element.selectedSize!);
      orderProducts.productColor = element.selectedColor;
      orderProducts.productPrice = num.parse(element.sellingPrice!).toInt();
      orderProducts.qty = element.selectedQty!;
      orderProducts.productImage = element.productThumbnail;

      return orderProducts;
    })
        .toList();

    return order1;
  }
}
