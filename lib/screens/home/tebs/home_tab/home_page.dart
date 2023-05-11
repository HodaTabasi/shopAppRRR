import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/widget/search_widget.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/widget/slider_widget.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../../../core/app_product_card.dart';
import '../../../../utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<int> l = [1, 2, 3, 5];
  late TabController controller;

  late TabController tabController;

  int currentIndex = 0;

  @override
  void initState() {
    controller = TabController(length: l.length, vsync: this);
    tabController = TabController(length: 3, vsync: this);
    APIGetxController.to.getAllProduct();
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
        title: Text(
          "welcome",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ).tr(),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/images/18 _ 20.svg",
              color: secondColor,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: InkWell(
              onTap: () {
                ZoomDrawer.of(context)!.toggle();
              },
              child: SvgPicture.asset("assets/images/16_16.svg"),
            ),
          )
        ],
      ),
      body: GetX<APIGetxController>(
        builder: (controller1) {
          return ListView(
            padding: EdgeInsets.all(16.r),
            children: [
              SearchWidget(),
              getSpace(h: 10.h),
              SliderWidget(controller: controller, l: APIGetxController.to.sliders),
              getSpace(h: 10.h),
              buildContainer(),
              getSpace(h: 10.h),
              GridView.builder(
                itemCount: controller1.products.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: sliver,
                itemBuilder: (context, index) {
                  return AppProductCard(controller1.products[index]);
                },
              )
            ],
          );
        }
      ),
    );
  }

  Container buildContainer() {
    return Container(
          decoration: decoration(blurRadius: 5,radius: 20.0.r),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: TabBar(
            controller: tabController,
            labelColor: Colors.white,
            onTap: (value) {
              setState(() {
                currentIndex = value;
                String key = "";
                switch(value){
                  case 0:
                    key = "trend";
                     break;
                  case 1:
                    key = "offers";
                     break;
                  case 2:
                    key = "trend";
                    break;
                }
                APIGetxController.to.products.value = APIGetxController.to.productMap[key]??[];
              });
            },
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: mainColor,
            ),
            unselectedLabelColor: thirdColor,
            tabs: [
              Tab(
                icon: Text("new").tr(),
              ),
              Tab(
                icon: Text("offer").tr(),
              ),
              Tab(
                icon: Text("more_sele").tr(),
              )
            ],
          ),
        );
  }
}


