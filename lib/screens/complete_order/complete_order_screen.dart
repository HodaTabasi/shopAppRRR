import 'package:easy_localization/easy_localization.dart' as data;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/controller/data/model/user.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/hive_getx_controller.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../controller/data/model/order.dart';
import '../../core/app_order_card.dart';

class CompleteOrderScreen extends StatefulWidget {
  @override
  State<CompleteOrderScreen> createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {
  num total = 0;
  late User user;

  @override
  void initState() {
    getTotalPrice();
    user = SharedPrefController().user;
    super.initState();
  }

  getTotalPrice() {
    APIGetxController.to.orderProduct.forEach((element) {
      total += element.selectedQty! * num.parse(element.sellingPrice!);
    });
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
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${controller.address}",
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ).tr(),
                        SvgPicture.asset("assets/images/address.svg")
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                        "الدفع عند الاستيلام",
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
                      ListItemWidget(
                          isOrder: false,
                          product: controller.orderProduct[index]),
                      Positioned(
                          top: 8,
                          left: 8,
                          child: InkWell(
                              onTap: () {},
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
                    "\$${total}",
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
                    "\$20",
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
                    "\$15",
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
                    "\$${total + 20 + 15}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            getSpace(h: 18.0.r),
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
    ApiResponse response = await APIGetxController.to.addOrder(order: order);
    showSnackBar(context: context,message: response.message,error: !response.success);
    if(response.success){
      if(APIGetxController.to.cartFlag){
        await HiveGetXController.to.deleteAllProductFromCart();
        APIGetxController.to.cartFlag = false;
      }
      Navigator.pushNamedAndRemoveUntil(context, '/main_screen', (route) => false);
    }
  }

  Order get order {
    Order order1 = Order();
    order1.customerId = user.id;
    order1.totalPrice = total.toInt();
    order1.address = "الخرطوم";
    order1.phone = user.phoneNumber.toString();
    order1.username = user.name.toString();
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
