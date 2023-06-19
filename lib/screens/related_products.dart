import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/get/product_controller/api_getx_controller.dart';
import 'package:rrr_shop_app/core/app_product_card.dart';
import 'package:rrr_shop_app/core/skeleton.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/widget/search_widget.dart';
import 'package:rrr_shop_app/utils/constants.dart';

class RelatedProductScreen extends StatefulWidget {
  @override
  State<RelatedProductScreen> createState() => _RelatedProductScreenState();
}

class _RelatedProductScreenState extends State<RelatedProductScreen> {


  @override
  Widget build(BuildContext context) {
    return GetX<APIGetxController>(builder: (controller) {

      return Scaffold(
        backgroundColor: Color(0xffFFFDFA),
        appBar: AppBar(
          title: Text("related_product",
              style: TextStyle(color: Colors.black)).tr(),
          centerTitle: true,
          backgroundColor: Color(0xffFFFDFA),
          elevation: 0,
          toolbarHeight: 80,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main_screen');
              },
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              )),

        ),
        body: GridView.builder(
          padding: EdgeInsets.all(8.r),
          itemCount: controller.relatedProducts.length,
          gridDelegate: sliver,
          itemBuilder: (context, index) {
            return AppProductCard(controller.relatedProducts[index]);
          },
        ),
      );
    });
  }
}
