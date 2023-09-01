import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/get/product_controller/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/product_controller/home_product_getx_controller.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/widget/search_widget.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/widget/slider_widget.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../../../controller/get/Notification_getx_controller.dart';
import '../../../../core/app_product_card.dart';
import '../../../../core/skeleton.dart';
import '../../../../utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<int> l = [1, 2, 3, 5];
  late TabController controller;

  late TabController tabController;
  late ScrollController scrollController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: l.length, vsync: this);
    tabController = TabController(length: 4, vsync: this);
    scrollController = ScrollController();
    scrollController.addListener(_listener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeGetxController.to.getAllProduct(page: HomeGetxController.to.currentPage);
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
        title: Text(
          "welcome",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ).tr(),
        centerTitle: true,
        leading: GetBuilder<NotificationGetxController>(
          builder: (controller) => Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/notification_screen');
                  },
                  icon: SvgPicture.asset(
                    "assets/images/18 _ 20.svg",
                    color: secondColor,
                  )),
              Positioned(
                top: 7,
                right: 8,
                child: Visibility(
                  visible: controller.notificationNumber > 0,
                  child: const CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: InkWell(
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ZoomDrawer.of(context)!.toggle();
                });
              },
              child: SvgPicture.asset("assets/images/16_16.svg"),
            ),
          )
        ],
      ),
      body: GetX<HomeGetxController>(builder: (controller1) {
        controller1.products.value =
            HomeGetxController.to.offers.isEmpty?HomeGetxController.to.productMap["new"] ?? []:HomeGetxController.to.productMap["all"] ?? [];
        return controller1.isLoading.value
            ? buildShimmer()
            : buildBody(controller1);
      }),
    );
  }

  ListView buildBody(HomeGetxController controller1) {
    return ListView(
      padding: EdgeInsets.all(16.r),
      controller: scrollController,
      children: [
        SearchWidget(),
        getSpace(h: 10.h),
        Visibility(
          visible: HomeGetxController.to.offers.isEmpty,
          child: SliderWidget(
              controller: controller, l: APIGetxController.to.sliders),
        ),
        Visibility(
            visible: HomeGetxController.to.offers.isEmpty,
            child: getSpace(h: 10.h)),
        Visibility(
            visible: HomeGetxController.to.offers.isEmpty,
            child: buildContainer()),
        getSpace(h: 10.h),
        GridView.builder(
          itemCount: controller1.products.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: sliver,
          itemBuilder: (context, index) {
            return AppProductCard(controller1.products[index]);
          },
        ),
        getSpace(h: 10.h),
        if (controller1.isPageLoading.value)
          Skeleton(
            width: double.infinity,
            height: 50.h,
          ),
      ],
    );
  }

  Padding buildShimmer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Skeleton(
            width: double.infinity,
            height: 50.h,
          ),
          getSpace(h: 20.h),
          Skeleton(
            width: double.infinity,
            height: 150.h,
          ),
          getSpace(h: 20.h),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: sliver,
              itemBuilder: (context, index) => Skeleton(),
            ),
          )
        ],
      ),
    );
  }

  Container buildContainer() {
    return Container(
      decoration: decoration(blurRadius: 5, radius: 20.0.r),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: TabBar(
        controller: tabController,
        labelColor: Colors.white,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            String key = "";
            switch (value) {
              case 3:
                key = "new";
                break;
              case 1:
                key = "offers";
                break;
              case 2:
                key = "trend";
                break;
              case 0:
                key = "all";
                break;
            }
            HomeGetxController.to.products.value =
                HomeGetxController.to.productMap[key] ?? [];
          });
        },
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: mainColor,
        ),
        unselectedLabelColor: thirdColor,
        tabs: [
          Tab(
            icon: Text("all").tr(),
          ),
          Tab(
            icon: Text("offer").tr(),
          ),
          Tab(
            icon: Text("more_sele").tr(),
          ),
          Tab(
            icon: Text("new2").tr(),
          ),
        ],
      ),
    );
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // print("fgddsd");
      // print("fgddsd ${HomeGetxController.to.lastPage}");
      HomeGetxController.to.currentPage++;
      if (HomeGetxController.to.currentPage <= HomeGetxController.to.lastPage)
        HomeGetxController.to
            .getAllProduct(page: HomeGetxController.to.currentPage);
    }
  }
}
