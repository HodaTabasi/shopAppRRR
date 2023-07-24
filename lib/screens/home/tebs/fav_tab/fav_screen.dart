import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/get/hive_getx_controller.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../../../core/app_product_card.dart';
import '../../../../utils/constants.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  // List<int> l = [1, 2, 3, 5,6,7,8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        toolbarHeight: 60.h,
        title: Text(
          "fav",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ).tr(),
        centerTitle: true,
      ),
      body: GetX<HiveGetXController>(
        builder: (controller) {
          return Padding(
            padding:  EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.favProducts.length} منتجات ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                ).tr(),
                getSpace(h: 10.h),
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.favProducts.length,
                    gridDelegate: sliver,
                    itemBuilder: (context, index) {
                      return Transform.translate(
                          offset: Offset(0.0, index.isEven ? 50 : 0.0),
                          child: AppProductCard(controller.favProducts[index]));
                    },
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
