import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../../../core/app_order_card.dart';
import '../../../../utils/constants.dart';

class CartPage extends StatefulWidget {

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> l = [1, 2, 3, 5];

  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
              child: SvgPicture.asset("assets/images/delete.svg"),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(value: false, onChanged: (val) {}),
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
              itemCount: l.length,
              itemBuilder: (context, index) {
                return ListItemWidget(isOrder: true);
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
                  "\$18",
                  style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ],
            ),
          ),
          BtnApp(title: "buy".tr(), prsee: (){
            Navigator.pushNamed(context, '/complete_buy_screen');
          })
        ],
      ),
    );
  }
}

