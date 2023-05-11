import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/hive_getx_controller.dart';
import 'package:rrr_shop_app/core/app_product_card.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/widget/search_widget.dart';
import 'package:rrr_shop_app/utils/constants.dart';

class CatProductScreen extends StatefulWidget {
  @override
  State<CatProductScreen> createState() => _CatProductScreenState();
}

class _CatProductScreenState extends State<CatProductScreen> {
  @override
  void initState() {
    APIGetxController.to.getProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetX<APIGetxController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xffFFFDFA),
          appBar: AppBar(
            title: Text(controller.category!.nameAr!, style: TextStyle(color: Colors.black)),
            centerTitle: true,
            backgroundColor: Color(0xffFFFDFA),
            elevation: 0,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            actions: [
              InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/main_screen');
                },
                child: SvgPicture.asset("assets/images/menu1.svg"),
              )
            ],
            bottom: PreferredSize(
                preferredSize:  Size.fromHeight(70.h),
                child: Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Row(
                    children: [
                      Expanded(child: SearchWidget()),
                      Padding(
                        padding:  EdgeInsets.all(8.0.r),
                        child: InkWell(
                          onTap: (){},
                          child: SvgPicture.asset("assets/images/fillter.svg"),
                        ),
                      )
                    ],
                  ),
                )),
          ),
           body: GridView.builder(
             padding: EdgeInsets.all(8.r),
               itemCount: controller.products.length,
               gridDelegate: sliver,
               itemBuilder: (context, index) {
                 return AppProductCard(controller.products[index]);
               },),
        );
      }
    );
  }
}
