import 'package:easy_localization/easy_localization.dart' as data;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/get/hive_getx_controller.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../../../controller/get/product_controller/api_getx_controller.dart';
import '../../../../core/app_order_card.dart';
import '../../../../utils/constants.dart';

class CartPage extends StatefulWidget {

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // List<int> l = [1, 2, 3, 5];
@override
  void initState() {

    // HiveGetXController.to.flag.value = List.generate(HiveGetXController.to.cartProducts.length, (index) => false);
    HiveGetXController.to.total.value = 0;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GetX<HiveGetXController>(
        builder: (controller) {
          return Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: background,
                toolbarHeight: 60.h,
                title: const Text(
                  "cart",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                ).tr(),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: InkWell(
                      onTap: () async {
                        controller.cartProducts.removeWhere((element){
                          // print(element.itemCartFlag);
                          if(element.itemCartFlag){
                            controller.deleteFromCart(id: element.id!);
                            return element.itemCartFlag;
                          }else {
                            return false;
                          }

                        });

                        if(controller.allValue.value){
                          controller.allValue.value = false;
                        }
                      },
                      child: SvgPicture.asset("assets/images/delete.svg"),
                    ),
                  )
                ],
              ),
              body:Column(
                children: [
                  Row(
                    children: [
                      Checkbox(value: controller.allValue.value, onChanged: (val) {
                        controller.allValue.value = val!;
                        controller.cartProducts.value = controller.cartProducts.map((element) {
                          element.itemCartFlag = val;
                          return element;
                        }).toList();

                      }),
                      const Text(
                        "product",
                        style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      ).tr(),
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.all(16.r),
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (context, index) {
                        return ListItemWidget(isOrder: true,product:controller.cartProducts[index],index: index,);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return getSpace(h: 16.h);
                      },
                    ),
                  ),
                  Divider(thickness: 1,color: divider,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "cost",
                          style:
                          TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16.sp),
                        ).tr(),
                        Text(
                          "SDG ${controller.getTotal()}",
                          style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: controller.cartProducts.isNotEmpty?1:0,
                    child: BtnApp(title: data.tr("buy"), prsee: (){
                      APIGetxController.to.cartFlag = true;
                      APIGetxController.to.putOrderProduct(list: controller.cartProducts.where((p0) => !p0.itemCartFlag).toList());
                      Navigator.pushNamed(context, '/complete_buy_screen');
                    }),
                  )
                ],
              )

          );
        }
    );



  }
}


